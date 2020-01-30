

resource "azurerm_databricks_workspace" "databricks" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  tags                = module.label.tags
}



