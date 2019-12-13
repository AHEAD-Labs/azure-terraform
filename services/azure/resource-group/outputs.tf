output "project_name" {
  value       = module.rg.project_name
  description = "Normalized project name"
}

output "name" {
  value       = module.rg.name
  description = "Normalized name"
}

output "application_name" {
  value       = module.rg.application_name
  description = "Normalized application name"
}

output "business_unit" {
  value       = module.rg.business_unit
  description = "Normalized business unit"
}

output "managed_by" {
  value       = module.rg.managed_by
  description = "Normalized managed by"
}

output "environment" {
  value       = module.rg.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = module.rg.attributes
  description = "Normalized attributes"
}

output "rg_name" {
  value       = module.rg.rg_name
  description = "Resource group name"
}

output "rg_location" {
  value       = module.rg.rg_location
  description = "Resource group location"
}

output "rg_id" {
  value       = module.rg.rg_id
  description = "Resource group id"
}