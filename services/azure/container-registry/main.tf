terraform {
  backend "s3" {}
}

provider "azurerm" {
  version         = "~> 1.0"
  subscription_id = var.subscription_id
}

module "registry" {
  source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/container-registry"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  rg_name          = data.terraform_remote_state.rg.outputs.rg_name
  rg_location      = data.terraform_remote_state.rg.outputs.rg_location
  admin_enabled    = var.admin_enabled
  sku              = var.sku
  //georeplication_locations = var.georeplication_locations
  name = var.name
}
