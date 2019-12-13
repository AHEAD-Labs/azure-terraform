output "virtual_network_id" {
  value = azurerm_virtual_network.gw.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.gw.name
}

output "virtual_network_address_space" {
  value = azurerm_virtual_network.gw.address_space
}

output "subnet_id" {
  value = azurerm_subnet.gw.id
}

output "subnet_name" {
  value = azurerm_subnet.gw.name
}

output "public_ip_id" {
  value = azurerm_public_ip.gw.id
}

output "public_ip_address" {
  value = azurerm_public_ip.gw.ip_address
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.gw.fqdn
}

output "application_gateway_id" {
  value = azurerm_application_gateway.network.id
}

output "application_gateway_name" {
  value = "app-gw-${random_string.appname.result}"
}