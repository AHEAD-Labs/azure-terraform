
terraform {
  experiments = [variable_validation]
}
module "rg" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/resource-group"
  source           = "../../../modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  delimiter        = var.delimiter
  attributes       = var.attributes
  tags             = var.tags
  enabled          = var.enabled
  name             = var.name
  location         = var.location
}



module "label" {
  source           = "../../../modules/generic/label"
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
