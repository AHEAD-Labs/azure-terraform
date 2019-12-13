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

resource "random_string" "name" {
  length  = 6
  special = false
  upper   = false
  lower   = true
  number  = true
}



resource "azurerm_sql_server" "main" {
  name                         = "${var.region}-sql-server-${random_string.name.result}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = var.database_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  tags                         = module.label.tags

}




resource "azurerm_sql_active_directory_administrator" "primary" {
  server_name         = azurerm_sql_server.main.name
  resource_group_name = var.resource_group_name
  login               = var.admin_email
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}



# This enables the database to talk with other azure services, without this you cannot log or use connection strings to any item without a static IP/vnet
resource "azurerm_sql_firewall_rule" "primary" {
  name                = "SQL-FW-Rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}


