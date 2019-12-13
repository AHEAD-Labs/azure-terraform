
module "front-door" {
  #source                                       = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/front-door?ref=v0.1.6"
  source                                       = "../../../modules/azure/front-door"
  business_unit                                = var.business_unit
  project_name                                 = var.project_name
  managed_by                                   = var.managed_by
  environment                                  = var.environment
  attributes                                   = var.attributes
  tags                                         = var.tags
  application_name                             = var.application_name
  name                                         = var.name
  resource_group_name                          = module.rg.resource_group_name
  location                                     = var.location
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  custom_https_provisioning_enabled            = var.custom_https_provisioning_enabled
  backends = [{
    address  = module.lb.ip_ip
    priority = 1
    }, {
    address  = module.lb.ip_ip
    priority = 2
  }]


  forwarding_protocol   = "MatchRequest"
  health_probe_interval = 15
}




variable "enforce_backend_pools_certificate_name_check" {
  description = "true or false"
  type        = string
  default     = false
}



variable "custom_https_provisioning_enabled" {
  description = "(Required) Name of the Frontend Endpoint."
  type        = string
  default     = false
}


variable "forwarding_protocol" {
  description = "MatchRequest, HTTPOnly, or HTTPSOnly."
  default     = "MatchRequest"

}