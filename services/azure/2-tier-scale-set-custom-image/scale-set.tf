
module "scale-set" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/scale-set?ref=feature/scale-set-custom-image"
  source                                  = "../../../../nic-terraform-modules/modules/azure/scale-set-custom-image"
  name                                    = var.name
  resource_group_name                     = module.rg.resource_group_name
  location                                = var.location
  business_unit                           = var.business_unit
  project_name                            = var.project_name
  application_name                        = var.application_name
  managed_by                              = var.managed_by
  environment                             = var.environment
  attributes                              = var.attributes
  tags                                    = var.tags
  automatic_os_upgrade                    = var.automatic_os_upgrade
  upgrade_policy_mode                     = var.upgrade_policy_mode
  sku_name                                = var.sku_name
  sku_tier                                = var.sku_tier
  capacity                                = var.capacity
  computer_name_prefix                    = var.computer_name_prefix
  admin_username                          = var.admin_username
  admin_password                          = module.pw-gen.result
  custom_data                             = null
  address_space                           = var.address_space
  address_prefix                          = var.address_prefix
  lb_pool_ids                             = [module.lb.backend_address_pool_id]
  health_probe_id                         = module.lb.probe_id
  subnet_id                               = module.network.subnet_id
  max_batch_instance_percent              = 20
  max_unhealthy_instance_percent          = 20
  max_unhealthy_upgraded_instance_percent = 5
  pause_time_between_batches              = "PT0S"
  image_resource_group_name = var.image_resource_group_name
  scaleset_image_name = var.scaleset_image_name
  gallery_name = var.gallery_name
  disk_size_gb = 60
}





module "network" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/vnet-with-subnet?ref=feature/vnet-with-subnet"
  source              = "../../../../nic-terraform-modules/modules/azure/vnet-with-subnet"
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
}








# Passwords and secrets

module "pw-gen" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/generic/random-string"
  source  = "../../../modules/generic/random-string"
  length  = 16
  special = true
  upper   = false
  lower   = true
  number  = true

}



module "server-pw" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "serverpassword"
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


module "username" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "serverusername"
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


module "lb" {
  #source = "git@ssh.dev.azure.com:v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/load-balancer?ref=feature/loadbalancer"
  source              = "../../../../nic-terraform-modules/modules/azure/load-balancer"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  lb_probe_path       = var.lb_probe_path
  protocol            = var.protocol
  name                = var.name
  remote_port = {
  rdp = ["Tcp", "3389"] }
}



#Rule

resource "azurerm_lb_nat_rule" "app-traffic1" {
  resource_group_name            = module.rg.resource_group_name
  loadbalancer_id                = module.lb.id
  name                           = "8443"
  protocol                       = "Tcp"
  frontend_port                  = 8443
  backend_port                   = 8443
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_nat_rule" "app-traffic2" {
  resource_group_name            = module.rg.resource_group_name
  loadbalancer_id                = module.lb.id
  name                           = "8080"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "PublicIPAddress"
}






# Load Balancer

variable "lb_probe_path" {
  type        = string
  default     = null
  description = " (Optional) The URI used for requesting health status from the backend endpoint. Required if protocol is set to Http. Otherwise, it is not allowed."
}

variable "protocol" {
  type        = string
  description = "http or https"
  default     = "http"
}


#variables


variable "sku_tier" {
  type = string
}

variable "sku_name" {
  type = string
}



variable "address_space" {
  type = string
}

variable "address_prefix" {
  type = string
}

# for a custom image this has to be false
variable "automatic_os_upgrade" {
  default     = false
  description = " (Optional) Automatic OS patches can be applied by Azure to your scaleset. This is particularly useful when upgrade_policy_mode is set to Rolling. Defaults to false."
  type        = bool
}

# for a custom image this has to be Manual
variable "upgrade_policy_mode" {
  default     = "Manual"
  description = "(Required) Specifies the mode of an upgrade to virtual machines in the scale set. Possible values, Rolling, Manual, or Automatic. When choosing Rolling, you will need to set a health probe."
  type        = string
}

variable "capacity" {
  type        = number
  description = "(Required) Specifies the number of virtual machines in the scale set."
 
}

variable "computer_name_prefix" {
  type        = string
  description = "(Required) Specifies the computer name prefix for all of the virtual machines in the scale set. Computer name prefixes must be 1 to 9 characters long for windows images and 1 - 58 for linux. Changing this forces a new resource to be created."
  default     = "ssvm"
}

variable "admin_username" {
  type        = string
  description = "(Required) Specifies the administrator account name to use for all the instances of virtual machines in the scale set."
}

variable "custom_data" {
  type        = string
  description = "(Optional) Specifies custom data to supply to the machine. On linux-based systems, this can be used as a cloud-init script. On other systems, this will be copied as a file on disk. Internally, Terraform will base64 encode this value before sending it to the API. The maximum length of the binary array is 65535 bytes."
  default     = ""
}

# Shared Image
variable "gallery_name" {
  type = string
}

variable "scaleset_image_name" {
  type = string
}


variable "image_resource_group_name" {
  type = string
}