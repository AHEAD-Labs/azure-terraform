# app service

output "id" {
  description = "The ID of the App Service."
  value       = azurerm_app_service.app.id
}

output "hostname" {
  description = "The Default Hostname associated with the App Service - such as mysite.azurewebsites.net"
  value       = azurerm_app_service.app.default_site_hostname
}

output "outbound_ip" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_app_service.app.outbound_ip_addresses
}

output "possible_ips" {
  description = " A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_app_service.app.possible_outbound_ip_addresses
}

output "source_contol" {
  description = "A source_control block as defined below, which contains the Source Control information when scm_type is set to LocalGit."
  value       = azurerm_app_service.app.source_control
}

output "site_credential" {
  description = "A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service."

  value = azurerm_app_service.app.site_credential
}








