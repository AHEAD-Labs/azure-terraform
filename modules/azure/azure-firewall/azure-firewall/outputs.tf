output "id" {
  description = "The Resource ID of the Azure Firewall."
  value       = azurerm_firewall.fw.id
}

output "ip_configuration" {
  description = "private_ip_address - The private IP address of the Azure Firewall."
  value       = azurerm_firewall.fw.id
}

output "pip" {
  description = "public ip assigned to the fw"
  value       = azurerm_public_ip.pip.ip_address
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}


