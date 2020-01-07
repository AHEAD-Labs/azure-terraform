module "datafactory" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/data-factory"
  source              = "../../../modules/azure/data-factory"
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  name                = "madisonsdatafactory"
  location            = var.location
  resource_group_name = module.rg.resource_group_name
}


# variables



