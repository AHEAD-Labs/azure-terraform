output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "scale_set_id" {
  value = azurerm_virtual_machine_scale_set.scale-set.id
}