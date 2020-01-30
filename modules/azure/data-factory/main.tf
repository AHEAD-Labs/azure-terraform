

resource "azurerm_data_factory" "datafactory" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags
}

