variable "storage_image_reference_version" {
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


variable "admin_username" {
    type = string 
}

variable "admin_password" {
    type = string 
}

variable "disable_password_authentication" {
    type = string 
}

variable "location" {
  type = string
}

