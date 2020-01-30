

resource "azurerm_sql_database" "main" {
  name                             = "${var.name}-DB"
  location                         = var.location
  resource_group_name              = var.resource_group_name
  server_name                      = var.server_name
  edition                          = var.database_edition
  requested_service_objective_name = var.database_size
  tags                             = module.label.tags

  threat_detection_policy {
    state                      = var.state
    retention_days             = var.retention_days
    email_addresses            = var.email_addresses
    storage_endpoint           = var.storage_endpoint
    storage_account_access_key = var.storage_account_access_key
    email_account_admins       = var.email_account_admins
    use_server_default         = var.use_server_default

  }



}


