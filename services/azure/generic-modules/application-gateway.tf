module "appgw" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/application-gateway"
  source           = "../../../../nic-terraform-modules/modules/azure/application-gateway"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = var.name
}