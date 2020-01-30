
resource "azurerm_key_vault_access_policy" "access" {
  key_vault_id = var.key_vault_id
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


