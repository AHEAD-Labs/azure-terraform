

provider "azurerm" {
  version         = "~> 1.35"
  subscription_id = var.subscription_id
}

terraform {
  backend "azurerm" {
    resource_group_name  = var.backend_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_container_name
    key                  = var.backend_key
  }
}


module "rg" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/resource-group"
  source           = "../../../../nic-terraform-modules/modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = var.name
}





