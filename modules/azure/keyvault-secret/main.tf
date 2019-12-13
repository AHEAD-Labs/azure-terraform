
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


resource "azurerm_key_vault_secret" "kv-secret" {
  name         = var.name
  value        = var.value
  key_vault_id = var.key_vault_id
  tags                         = module.label.tags
}