output "ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "id" {
  value = azurerm_firewall.fw.id
}

