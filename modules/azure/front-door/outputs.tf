output "backend_pool_id" {
  value = azurerm_frontdoor.front-door.backend_pool.*.id
}


output "frontend_endpoint_id" {
  value = azurerm_frontdoor.front-door.frontend_endpoint.*.id
}





output "backend_pool_health_probe_id" {
  value = azurerm_frontdoor.front-door.backend_pool_health_probe.*.id
}

output "routing_rule_id" {
  value = azurerm_frontdoor.front-door.routing_rule.*.id
}

output "front_door_cname" {
  value = azurerm_frontdoor.front-door.cname
}

output "backend_pool_health_probe" {
  value = azurerm_frontdoor.front-door.*.id
}

#firewall


output "fw-id" {
  value = azurerm_frontdoor_firewall_policy.fw-policy.id
}

output "fw-location" {
  value = azurerm_frontdoor_firewall_policy.fw-policy.location
}

