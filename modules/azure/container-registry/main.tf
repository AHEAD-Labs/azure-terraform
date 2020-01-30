

resource "azurerm_container_registry" "acr" {
  count               = var.enabled ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags                = module.label.tags
  georeplication_locations = var.georeplication_locations
}