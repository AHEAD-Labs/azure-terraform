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

output "rg_name" {
  value = var.rg_name
}

output "location" {
  value = var.location
}

output "id" {
  value = join("", azurerm_container_registry.acr.*.id)
}

output "login_server" {
  value = join("", azurerm_container_registry.acr.*.login_server)
}

output "admin_username" {
  value = join("", azurerm_container_registry.acr.*.admin_username)
}

output "admin_password" {
  value = join("", azurerm_container_registry.acr.*.admin_password)
}


