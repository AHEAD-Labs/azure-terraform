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

resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = "${var.environment}-${var.application_name}${var.name}"
  location = var.location
  tags     = module.label.tags
}