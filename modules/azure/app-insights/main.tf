resource "random_string" "appname" {
  length  = 8
  special = false
  upper   = false
  lower   = true
  number  = true
}

# App service plan

resource "azurerm_application_insights" "main" {
  name                = "${random_string.appname.result}-AppInsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  tags                = module.label.tags
}


