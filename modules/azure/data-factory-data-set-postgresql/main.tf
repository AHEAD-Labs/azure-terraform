

resource "azurerm_data_factory_linked_service_postgresql" "linked-service" {
  name                = "example"
  resource_group_name = var.resource_group_name
  data_factory_name   = var.data_factory_name
  connection_string   = var.connection_string

}

resource "azurerm_data_factory_dataset_postgresql" "dataset-postgresql" {
  name                = "example"
  resource_group_name = var.resource_group_name
  data_factory_name   = var.data_factory_name
  linked_service_name = azurerm_data_factory_linked_service_postgresql.linked-service.name

}



