

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





