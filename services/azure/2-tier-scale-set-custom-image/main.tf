

provider "azurerm" {
  version         = "~> 1.35"
  subscription_id = var.subscription_id
}




module "rg" {
  #source = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/resource-group?ref=feature/resource-group"
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





