module "vm" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/scale-set?ref=feature/scale-set"
  source                           = "../../../modules/azure/windows-vm"
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
  admin_username                   = var.admin_username
  admin_password                   = module.pw-gen.result
  custom_data                      = null
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  network_interface_ids            = module.nic.id
}


module "vm2" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/scale-set?ref=feature/scale-set"
  source                           = "../../../modules/azure/linux-vm"
  resource_group_name              = module.rg.resource_group_name
  location                         = var.location
  business_unit                    = var.business_unit
  project_name                     = var.project_name
  application_name                 = var.application_name
  managed_by                       = var.managed_by
  environment                      = var.environment
  attributes                       = var.attributes
  tags                             = var.tags
  admin_username                   = var.admin_username
  admin_password                   = module.pw-gen.result
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  network_interface_ids            = module.nic2.id
  publisher                        = var.publisher
  offer                            = var.offer
  sku                              = var.sku
  caching                          = var.caching
  create_option                    = var.create_option
  managed_disk_type                = var.managed_disk_type
  disable_password_authentication  = var.disable_password_authentication
  storage_image_reference_version  = var.storage_image_reference_version

}


module "vm3" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/scale-set?ref=feature/scale-set"
  source                           = "../../../modules/azure/linux-vm"
  resource_group_name              = module.rg.resource_group_name
  location                         = var.location
  business_unit                    = var.business_unit
  project_name                     = var.project_name
  application_name                 = var.application_name
  managed_by                       = var.managed_by
  environment                      = var.environment
  attributes                       = var.attributes
  tags                             = var.tags
  admin_username                   = var.admin_username
  admin_password                   = module.pw-gen.result
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  network_interface_ids            = module.nic2.id
  publisher                        = var.publisher
  offer                            = var.offer
  sku                              = var.sku
  caching                          = var.caching
  create_option                    = var.create_option
  managed_disk_type                = var.managed_disk_type
  disable_password_authentication  = var.disable_password_authentication
  storage_image_reference_version  = var.storage_image_reference_version

}

module "pw-gen" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/generic/random-string"
  source  = "../../../modules/generic/random-string"
  length  = 32
  special = true
  upper   = true
  lower   = true
  number  = true

}



module "kv-pw-gen" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "vm-password"
  value            = module.pw-gen.result
  key_vault_id     = module.kv.key_vault_id
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  location         = var.location
}


module "admin_username" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "vm-username"
  value            = var.admin_username
  key_vault_id     = module.kv.key_vault_id
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  location         = var.location
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
  address_space       = var.address_space
  address_prefix      = var.address_prefix
  name                = var.name
    service_endpoints    = "Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"

}


module "nic" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/vnet-with-subnet?ref=feature/network-interface"
  source                        = "../../../modules/azure/network-interface"
  resource_group_name           = module.rg.resource_group_name
  location                      = var.location
  business_unit                 = var.business_unit
  project_name                  = var.project_name
  application_name              = var.application_name
  managed_by                    = var.managed_by
  environment                   = var.environment
  attributes                    = var.attributes
  tags                          = var.tags
  name                          = "${var.name}-1"
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                     = module.network.subnet_id
}


module "nic2" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/vnet-with-subnet?ref=feature/network-interface"
  source                        = "../../../modules/azure/network-interface"
  resource_group_name           = module.rg.resource_group_name
  location                      = var.location
  business_unit                 = var.business_unit
  project_name                  = var.project_name
  application_name              = var.application_name
  managed_by                    = var.managed_by
  environment                   = var.environment
  attributes                    = var.attributes
  tags                          = var.tags
  name                          = "${var.name}-2"
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                     = module.network.subnet_id
}


module "nic3" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/vnet-with-subnet?ref=feature/network-interface"
  source                        = "../../../modules/azure/network-interface"
  resource_group_name           = module.rg.resource_group_name
  location                      = var.location
  business_unit                 = var.business_unit
  project_name                  = var.project_name
  application_name              = var.application_name
  managed_by                    = var.managed_by
  environment                   = var.environment
  attributes                    = var.attributes
  tags                          = var.tags
  name                          = "${var.name}-3"
  private_ip_address_allocation = var.private_ip_address_allocation
  subnet_id                     = module.network.subnet_id
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

variable "vm_sku_tier" {
  type        = string
  description = "The size of the virual machine"
}


# Network

variable "address_space" {
  type = string
}

variable "address_prefix" {
  type = string
}

variable "private_ip_address_allocation" {
  type = string
}






# Linux VM

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "caching" {
  type = string
}

variable "create_option" {
  type = string
}

variable "managed_disk_type" {
  type = string
}

variable "disable_password_authentication" {
  type = string
}

variable "storage_image_reference_version" {
  type = string
}

variable "delete_data_disks_on_termination" {
  type = string
}

variable "delete_os_disk_on_termination" {
  type = string
}






    