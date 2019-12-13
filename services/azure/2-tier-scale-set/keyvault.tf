
module "kv" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/keyvault"
  source              = "../../../modules/azure/keyvault"
  resource_group_name = module.rg.resource_group_name
  tenant_id           = var.tenant_id
  location            = var.location
  name                = "kv"
  sku_name            = "standard"
  # The object_id that needs access to the keyvault
  object_id        = var.object_id
  environment      = var.environment
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  attributes       = var.attributes
  tags             = var.tags


}
