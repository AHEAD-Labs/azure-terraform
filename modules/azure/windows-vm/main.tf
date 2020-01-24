


module "label" {
  source           = "../../generic/label"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  delimiter        = var.delimiter
  attributes       = var.attributes
  tags             = var.tags
  region           = var.location
  enabled          = var.enabled
}

resource "azurerm_virtual_machine" "windows-vm" {
  name                = "${var.name}-vm"
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
    name              = "storagedisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "${var.name}-disk"
    admin_username       = var.admin_username
    admin_password       = var.admin_password
    custom_data          = var.custom_data
  }

  os_profile_windows_config {

    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

}

