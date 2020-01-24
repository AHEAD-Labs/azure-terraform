variable "storage_image_reference_version" {
    type = string 
}

variable "storage_os_disk_name" {
    type = string 
}
variable "business_unit" {
    type = string 
}



variable "name" {
    type = string 
}

variable "project_name" {
    type = string 
}

variable "application_name" {
    type = string 
}

variable "managed_by" {
    type = string 
}

variable "environment" {
    type = string 
}

variable "delimiter" {
    type = string 
}

variable "attributes" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}


variable "location" {
    type = string 
}

variable "enabled" {
    type = string 
}

variable "prefix" {
    type = string 
}

variable "resource_group_name" {
    type = string 
}

variable "network_interface_ids" {
    type = string 
}

variable "vm_size" {
    type = string 
}

variable "delete_os_disk_on_termination" {
    type = string 
}

variable "delete_data_disks_on_termination" {
    type = string 
}

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

variable "computer_name" {
    type = string 
}

variable "admin_username" {
    type = string 
}

variable "admin_password" {
    type = string 
}

variable "disable_password_authentication" {
    type = string 
}
