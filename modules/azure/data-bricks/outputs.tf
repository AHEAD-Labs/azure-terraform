output "id" {
  value       = azurerm_databricks_workspace.databricks.id
  description = "The ID of the Databricks Workspace"
}

output "managed_resource_group_id" {
  value       = azurerm_databricks_workspace.databricks.managed_resource_group_id
  description = "The ID of the Managed Resource Group created by the Databricks Workspace"
}

