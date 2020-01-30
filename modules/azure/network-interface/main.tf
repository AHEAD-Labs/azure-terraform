resource "azurerm_network_interface" "nic" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = module.label.tags

  ip_configuration {
    name                          = "${var.name}-IP"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }


}

# Variables 

variable "name" {
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group, this belongs to"
  type = string
}

variable "subnet_id" {
  description = "the subnet this belongs to"  
  type = string
}

variable "private_ip_address_allocation" {
  description = "Static or Dynamic assignment"
  type = string 
}
