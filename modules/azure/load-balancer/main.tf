resource "random_string" "name" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

module "label" {
  source           = "../../generic/label"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  delimiter        = var.delimiter
  attributes       = var.attributes
  tags             = var.tags
  region           = var.location
  enabled          = var.enabled
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.name}-pip-${random_string.name.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = "${var.resource_group_name}-${random_string.name.result}"

  tags = module.label.tags
}

resource "azurerm_lb" "lb" {
  name                = "${var.name}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }
  tags = module.label.tags
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_nat_rule" "azlb" {
  count                          = length(var.remote_port)
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "VM-${count.index}"
  protocol                       = "tcp"
  frontend_port                  = "5000${count.index + 1}"
  backend_port                   = var.remote_port[keys(var.remote_port)[count.index]][1]
  frontend_ip_configuration_name = var.frontend_name
}

resource "azurerm_lb_probe" "probe" {
  count               = length(var.lb_port) * (var.enabled && var.probe_enabled ? 1 : 0)
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "${var.name}-probe"
  request_path        = var.lb_probe_path
  protocol            = var.lb_port[keys(var.lb_port)[count.index]][1]
  port                = var.lb_port[keys(var.lb_port)[count.index]][2]
  interval_in_seconds = var.lb_probe_interval
  number_of_probes    = var.lb_probe_unhealthy_threshold
}

resource "azurerm_lb_rule" "azlb" {
  count                          = length(var.lb_port) * (var.enabled && var.probe_enabled ? 1 : 0)
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = keys(var.lb_port)[count.index]
  protocol                       = var.lb_port[keys(var.lb_port)[count.index]][1]
  frontend_port                  = var.lb_port[keys(var.lb_port)[count.index]][0]
  backend_port                   = var.lb_port[keys(var.lb_port)[count.index]][2]
  frontend_ip_configuration_name = var.frontend_name
  enable_floating_ip             = false
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.probe.*.id[count.index]
  depends_on                     = ["azurerm_lb_probe.probe"]
}
