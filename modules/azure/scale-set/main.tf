


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




resource "azurerm_network_security_group" "nsg" {
  name                = "scale-set-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags
}

resource "azurerm_network_security_rule" "nsg-rule" {
  count                       = var.allow_http ? 1 : 0
  name                        = "${var.resource_group_name}httpallow"
  priority                    = 100
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}


resource "azurerm_virtual_machine_scale_set" "scale-set" {
  name                = "${module.label.name}-${var.name}-scale-set"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = module.label.tags


  # automatic rolling upgrade
  automatic_os_upgrade = var.automatic_os_upgrade
  upgrade_policy_mode  = var.upgrade_policy_mode

  rolling_upgrade_policy {
    max_batch_instance_percent              = 20
    max_unhealthy_instance_percent          = 20
    max_unhealthy_upgraded_instance_percent = 5
    pause_time_between_batches              = "PT0S"
  }

  # required when using rolling upgrade policy
  health_probe_id = var.health_probe_id

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.capacity
  }

  storage_profile_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os
    version   = var.os_version
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
    computer_name_prefix = var.computer_name
    admin_username       = var.admin_username
    custom_data          = var.custom_data
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = var.public_key
    }
  }

  network_profile {
    name    = "terraformnetworkprofile"
    primary = true

    ip_configuration {
      name                                   = "IPConfiguration"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = var.lb_pool_ids
    }
  }


}

