

resource "azurerm_resource_group" "rg" {
  count    = var.enabled ? 1 : 0
  name     = var.name
  location = var.location
  tags     = module.label.tags
}