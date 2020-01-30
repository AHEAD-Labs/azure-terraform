

resource "random_string" "fdname" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  number  = true
}
resource "azurerm_frontdoor" "front-door" {
  name                                         = "${random_string.fdname.result}-fd"
  location                                     = var.location
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  tags                                         = module.label.tags

  routing_rule {
    name               = "${var.name}-rule"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.name}-frontend-endpoint"]
    forwarding_configuration {
      forwarding_protocol = var.forwarding_protocol
      backend_pool_name   = "${var.name}-backend-pool"
    }
  }

  backend_pool_load_balancing {
    name = "${var.name}-lbname"
  }

  backend_pool_health_probe {
    name                = "${var.name}-health-probe"
    path                = var.health_probe_path
    protocol            = var.health_probe_protocol
    interval_in_seconds = var.health_probe_interval
  }


  backend_pool {
    name = "${var.name}-backend-pool"
    dynamic "backend" {
      for_each = var.backends
      content {
        http_port   = lookup(backend.value, "http_port", 80)
        https_port  = lookup(backend.value, "https_port", 443)
        host_header = lookup(backend.value, "host_header", backend.value.address)
        address     = backend.value.address
        priority    = lookup(backend.value, "priority", 1)
        weight      = lookup(backend.value, "weight", 50)
      }
    }
    load_balancing_name = "${var.name}-lbname"
    health_probe_name   = "${var.name}-health-probe"
  }



  frontend_endpoint {
    name                                    = "${var.name}-frontend-endpoint"
    host_name                               = "${random_string.fdname.result}-fd.azurefd.net"
    custom_https_provisioning_enabled       = var.custom_https_provisioning_enabled
    web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.fw-policy.id
  }
}

# Firewall policy

resource "azurerm_frontdoor_firewall_policy" "fw-policy" {
  name                              = "${var.name}fwpolicy"
  resource_group_name               = var.resource_group_name
  enabled                           = true
  mode                              = "Prevention"
  redirect_url                      = "https://www.contoso.com"
  custom_block_response_status_code = 403
  custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="
  tags                              = module.label.tags

  custom_rule {
    name                           = "Rule1"
    enabled                        = true
    priority                       = 1
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 10
    type                           = "MatchRule"
    action                         = "Block"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values       = ["192.168.1.0/24", "10.0.0.0/24"]
    }
  }

  custom_rule {
    name                           = "Rule2"
    enabled                        = true
    priority                       = 2
    rate_limit_duration_in_minutes = 1
    rate_limit_threshold           = 10
    type                           = "MatchRule"
    action                         = "Block"

    match_condition {
      match_variable     = "RemoteAddr"
      operator           = "IPMatch"
      negation_condition = false
      match_values       = ["192.168.1.0/24"]
    }

    match_condition {
      match_variable     = "RequestHeader"
      selector           = "UserAgent"
      operator           = "Contains"
      negation_condition = false
      match_values       = ["windows"]
      transforms         = ["Lowercase", "Trim"]
    }
  }

  managed_rule {
    type    = "DefaultRuleSet"
    version = "preview-0.1"

    override {
      rule_group_name = "PHP"

      rule {
        rule_id = "933111"
        enabled = false
        action  = "Block"
      }
    }
  }

  managed_rule {
    type    = "BotProtection"
    version = "preview-0.1"
  }
}


