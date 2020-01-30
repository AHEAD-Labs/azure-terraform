


resource "random_string" "storage" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "azurerm_storage_account" "main" {
  name                      = "${var.name}${random_string.storage.result}storage"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  enable_https_traffic_only = var.enable_https_traffic_only
  tags                      = module.label.tags
}




