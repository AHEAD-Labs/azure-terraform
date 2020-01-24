
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



resource "azurerm_subnet" "subnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefix       = var.address_prefix
}