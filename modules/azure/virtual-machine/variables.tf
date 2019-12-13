variable "resource_group_name" {
  description = " "
  type = string
}

variable "location" {
description = " "
  type = string
}

variable "prefix" {
  description = " "
  type = string
}


variable "subnet_id" {
  description = " "
  type = string
}

variable "private_ip_address_allocation" {
  description = " "
  type = string
}

variable "network_interface_ids" {
  description = " "
  type = string
}

variable "vm_size" {
 description = " "
 type =  string
}

variable "delete_os_disk_on_termination" {
  description = " "
  type = string
}

variable "delete_data_disks_on_termination" {
  description = " "
  type = string
}

variable "publisher" {
  description = " "
  type = string
}

variable "offer" {
 description = " "
  type = string
}

variable "sku" {
  description = " "
  type = string
}

variable "image_version" {
  description = " "
  type = string
}

variable "caching" {
  description = " "
  type = string
}

variable "create_option" {
  description = " "
  type = string
}

variable "managed_disk_type" {
  description = " "
  type = string
}

variable "computer_name" {
  description = " "
  type = string
}

variable "admin_username" {
  description = " "
  type = string
}

variable "admin_password" {
  description = " "
  type = string
}

variable "provision_vm_agent" {
  description = " "
  type = string
}






# Tags
variable "business_unit" {
  description = "Business unit for the project - Portal name or business unit name"
  type        = string
}

variable "project_name" {
  description = "Project name. e.g. 'Gov2Go'"
  type        = string
}

variable "application_name" {
  description = "Application name, e.g. 'app' or 'jenkins"
  type        = string
}

variable "managed_by" {
  description = "Organization team name or group. e.g. 'ETS-SRE'"
  type        = string
}

variable "environment" {
  type = string
}

variable "delimiter" {
  default = "-"
}

variable "attributes" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}