module "vm" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/scale-set?ref=feature/scale-set"
  source                           = "../../../modules/azure/windows-vm"
  name                             = var.name
  resource_group_name              = module.rg.resource_group_name
  location                         = var.location
  business_unit                    = var.business_unit
  project_name                     = var.project_name
  application_name                 = var.application_name
  managed_by                       = var.managed_by
  environment                      = var.environment
  attributes                       = var.attributes
  tags                             = var.tags
  os                               = var.os
  os_offer                         = var.os_offer
  os_publisher                     = var.os_publisher
  os_version                       = var.os_version
  sku_tier                         = var.vm_sku_tier
  computer_name                    = var.computer_name
  admin_username                   = var.admin_username
  admin_password                   = module.pw-gen.result
  custom_data                      = null
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = false
  delete_os_disk_on_termination    = false
  subnet_id                        =  module.network.subnet_id
  network_interface_ids            = module.network.vnet_id
}

module "pw-gen" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/generic/random-string"
  source  = "../../../modules/generic/random-string"
  length  = 32
  special = true
  upper   = false
  lower   = true
  number  = true

}



module "kv-pw-gen" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "db-password"
  value            = module.pw-gen.result
  key_vault_id     = module.kv.key_vault_id
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  location         = var.primary_location
}


module "network" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/vnet-with-subnet?ref=feature/vnet-with-subnet"
  source              = "../../../modules/azure/vnet-with-subnet"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  address_space                    = var.address_space
  address_prefix                   = var.address_prefix
  name                = var.name
}









# Variables




variable "vm_size" {
  type = string
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}

variable "os" {
  type        = string
  description = "Operating system of scaleset"
}

variable "os_offer" {
  type        = string
  description = "Offer of Operating system (UbuntuServer)"
}

variable "os_publisher" {
  type        = string
  description = "Publisher of Operating system (Canonical)"
}

variable "os_version" {
  type        = string
  description = "Operating system of scaleset"
  default     = "latest"
}

variable "address_space" {
  type = string
}

variable "address_prefix" {
  type = string
}

variable "computer_name" {
  type        = string
  description = "(Required) Specifies the computer name prefix for all of the virtual machines in the scale set. Computer name prefixes must be 1 to 9 characters long for windows images and 1 - 58 for linux. Changing this forces a new resource to be created."
}

variable "vm_sku_tier" {
  type        = string
  description = "The size of the virual machine"
}