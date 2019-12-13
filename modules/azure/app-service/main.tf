
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

resource "azurerm_app_service" "app" {
  name                    = "${random_string.appname.result}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = azurerm_app_service_plan.main.id
  client_affinity_enabled = true
  https_only              = true
  enabled                 = true
  tags                    = module.label.tags

  backup {
    name                = "Backup"
    storage_account_url = var.storage_account_url

    schedule {
      frequency_interval = var.frequency_interval
      frequency_unit     = var.frequency_unit 
    }
  }

  site_config {
    always_on                 = true
    use_32_bit_worker_process = true
    php_version               = "5.6"
    default_documents         = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    websockets_enabled        = false
    managed_pipeline_mode     = "Integrated"
    http2_enabled             = false
    ip_restriction = [{
      ip_address                = var.ip_address,
      subnet_mask               = var.subnet_mask,
      virtual_network_subnet_id = null


    }]


  }

  app_settings = {
    "ApplicationInsightsInstrumentationKey" = var.ApplicationInsightsInstrumentationKey
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = var.APPINSIGHTS_INSTRUMENTATIONKEY
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = var.value
  }


}




