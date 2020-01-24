
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

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags
}

