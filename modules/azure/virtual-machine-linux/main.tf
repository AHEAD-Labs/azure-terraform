


resource "random_string" "name" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}




resource "azurerm_virtual_machine" "main" {
  name                  = "${random_string.name.result}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids]
  vm_size               = var.vm_size
  tags                  = module.label.tags

  delete_os_disk_on_termination = var.delete_os_disk_on_termination


  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.storage_image_reference_version
  }
  storage_os_disk {
    name              = "${random_string.name.result}-disk"
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = "${random_string.name.result}-profile"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }

}