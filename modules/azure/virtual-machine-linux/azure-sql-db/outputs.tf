output "id" {
  description = "The SQL Database ID."
  value       = azurerm_sql_database.main.id
}


output "default_secondary_location" {
  description = "The default secondary location of the SQL Database."
  value       = azurerm_sql_database.main.default_secondary_location
}

output "name" {
  description = "The SQL Database name"
  value       = azurerm_sql_database.main.name
}
