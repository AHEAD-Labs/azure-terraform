output "project_name" {
  value       = module.label.project_name
  description = "Normalized project name"
}

output "name" {
  value       = module.label.name
  description = "Normalized name"
}

output "application_name" {
  value       = module.label.application_name
  description = "Normalized application name"
}

output "business_unit" {
  value       = module.label.business_unit
  description = "Normalized business unit"
}

output "managed_by" {
  value       = module.label.managed_by
  description = "Normalized managed by"
}

output "environment" {
  value       = module.label.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = module.label.attributes
  description = "Normalized attributes"
}

output "resource_group_name" {
  value = join("", azurerm_resource_group.rg.*.name)
}

output "rg_location" {
  value = join("", azurerm_resource_group.rg.*.location)
}

output "rg_id" {
  value = join("", azurerm_resource_group.rg.*.id)
}
