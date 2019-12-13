

output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.bpepool.id
}

output "probe_id" {
  value = join("", azurerm_lb_probe.probe.*.id)
}

output "ip_id" {
  value = azurerm_public_ip.pip.id
}

output "ip_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "ip_fqdn" {
  value = azurerm_public_ip.pip.fqdn
}

output "azurerm_lb_nat_rule_ids" {
  description = "the ids for the azurerm_lb_nat_rule resources"
  value       = azurerm_lb_nat_rule.azlb.*.id
}