
resource "random_string" "appname" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "azurerm_virtual_network" "gw" {
  name                = "hub-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_space]
}

resource "azurerm_subnet" "gw" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.gw.name
  address_prefix       = var.subnet_space

  service_endpoints = ["Microsoft.web"]
}
resource "azurerm_public_ip" "gw" {
  name                = "App-GW-PIP"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

locals {
  backend_address_pool_name      = "${azurerm_virtual_network.gw.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.gw.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.gw.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.gw.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.gw.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.gw.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.gw.name}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = "app-gw-${random_string.appname.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  ssl_certificate {
    name     = var.cert_name
    data     = var.cert
    password = var.cert_pw
  }

  sku {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = 2
  }

  waf_configuration {
    enabled          = "true"
    firewall_mode    = "Detection"
    rule_set_type    = "OWASP"
    rule_set_version = "3.0"
  }
  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.gw.id
  }

  frontend_port {
    name = "${local.frontend_port_name}"
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.gw.id
  }

  backend_address_pool {
    name = "${local.backend_address_pool_name}"
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${local.listener_name}"
    frontend_ip_configuration_name = "${local.frontend_ip_configuration_name}"
    frontend_port_name             = "${local.frontend_port_name}"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${local.request_routing_rule_name}"
    rule_type                  = "Basic"
    http_listener_name         = "${local.listener_name}"
    backend_address_pool_name  = "${local.backend_address_pool_name}"
    backend_http_settings_name = "${local.http_setting_name}"
  }
}