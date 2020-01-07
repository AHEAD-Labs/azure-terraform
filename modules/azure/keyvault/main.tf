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



resource "azurerm_key_vault" "main" {
  name                            = "${var.name}-keyvault"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  tenant_id                       = var.tenant
  sku_name                        = var.sku_name
  tags                            = module.label.tags
}


resource "azurerm_key_vault_access_policy" "access" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = var.tenant
  object_id    = var.object_id


  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
  ]

  key_permissions = [
    "backup",
    "create",
    "decrypt",
    "delete",
    "encrypt",
    "get",
    "import",
    "list",
    "purge",
    "recover",
    "restore",
    "sign",
    "unwrapKey",
    "update",
    "verify",
    "wrapKey",
  ]



  storage_permissions = [
    "get",
    "list",
    "set",
    "delete",
  ]

  certificate_permissions = [
    "backup",
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "restore",
    "setissuers",
    "update",
  ]
}


