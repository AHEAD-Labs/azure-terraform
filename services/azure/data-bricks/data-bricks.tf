module "databricks" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/data-bricks"
  source              = "../../../modules/azure/data-bricks"
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  name                = var.name
  location            = var.location
  sku                 = var.sku
  resource_group_name = module.rg.resource_group_name
}


# variables

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace. Possible values are standard or premium. Changing this forces a new resource to be created."
}

