# app service

output "id" {
  description = "The ID of the App Service."
  value       = azurerm_function_app.app.id
}

output "outbound_ip" {
  description = "A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_function_app.app.outbound_ip_addresses
}

output "possible_ips" {
  description = " A comma separated list of outbound IP addresses - such as 52.23.25.3,52.143.43.12,52.143.43.17 - not all of which are necessarily in use. Superset of outbound_ip_addresses."
  value       = azurerm_function_app.app.possible_outbound_ip_addresses
}

output "site_credential" {
  description = "A site_credential block as defined below, which contains the site-level credentials used to publish to this App Service."

  value = azurerm_function_app.app.site_credential
}

output "default_hostname" {
  value = azurerm_function_app.app.default_hostname
}







