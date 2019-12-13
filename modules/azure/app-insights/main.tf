
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

resource "azurerm_application_insights" "main" {
  name                = "${random_string.appname.result}-AppInsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  tags                = module.label.tags
}


