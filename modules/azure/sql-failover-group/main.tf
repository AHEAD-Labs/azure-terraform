resource "azurerm_sql_failover_group" "failover_group" {
  name                = "${var.name}-failover-group"
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  databases           = var.databases
  partner_servers {
    id = var.id
  }

  read_write_endpoint_failover_policy {
    mode          = var.mode
    grace_minutes = var.grace_minutes
  }
}