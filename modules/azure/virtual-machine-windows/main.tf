
resource "random_string" "name" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}




resource "azurerm_virtual_machine" "windows-vm" {
  name                = "${random_string.name.result}-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags
  network_interface_ids = [var.network_interface_ids]
  vm_size               = var.vm_size


  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination


  

  storage_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os
    version   = var.os_version
  }

  storage_os_disk {
    name              = "${random_string.name.result}-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "${random_string.name.result}-profile"
    admin_username       = var.admin_username
    admin_password       = var.admin_password
    custom_data          = var.custom_data
  }

  os_profile_windows_config {

    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

}

