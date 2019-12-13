output "project_name" {
  value       = module.registry.project_name
  description = "Normalized project name"
}

output "name" {
  value       = module.registry.name
  description = "Normalized name"
}

output "application_name" {
  value       = module.registry.application_name
  description = "Normalized application name"
}

output "business_unit" {
  value       = module.registry.business_unit
  description = "Normalized business unit"
}

output "managed_by" {
  value       = module.registry.managed_by
  description = "Normalized managed by"
}

output "environment" {
  value       = module.registry.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = module.registry.attributes
  description = "Normalized attributes"
}

output "rg_name" {
  value = data.terraform_remote_state.rg.outputs.rg_name
}

output "rg_location" {
  value = data.terraform_remote_state.rg.outputs.rg_location
}

output "id" {
  value = module.registry.id
}

output "login_server" {
  value = module.registry.login_server
}

output "admin_username" {
  value = module.registry.admin_username
}

output "admin_password" {
  value = module.registry.admin_password
}