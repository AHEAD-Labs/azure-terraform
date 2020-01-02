
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

locals {
  app_settings = merge({
    "ApplicationInsightsInstrumentationKey" = var.ApplicationInsightsInstrumentationKey
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = var.APPINSIGHTS_INSTRUMENTATIONKEY
  }, var.app_settings)
}

resource "random_string" "appname" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  number  = true
}

# App service plan



resource "azurerm_app_service_plan" "main" {
  name                = "${random_string.appname.result}-appserviceplan"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags



  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_function_app" "app" {
  name                      = var.app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = azurerm_app_service_plan.main.id
  storage_connection_string = var.storage_account_url
  client_affinity_enabled   = true
  https_only                = true
  enabled                   = true
  tags                      = module.label.tags

  site_config {
    always_on                 = true
    use_32_bit_worker_process = true
    websockets_enabled        = false

    }

  app_settings = local.app_settings

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = var.value
  }


}




