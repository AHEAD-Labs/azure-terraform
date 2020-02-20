

output "resource_group_name" {
  value = join("", azurerm_resource_group.rg.*.name)
}

output "rg_location" {
  value = join("", azurerm_resource_group.rg.*.location)
}

output "rg_id" {
  value = join("", azurerm_resource_group.rg.*.id)
}
