

provider "azurerm" {
  version         = "~> 1.35"
  subscription_id = var.subscription_id
}




module "rg" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/resource-group"
  source           = "../../../modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = "test-ta2020-rg"
  location         = var.location
}







