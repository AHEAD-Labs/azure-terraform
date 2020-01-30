
variable "admin_password" {
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

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
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




variable "sku_name" {
  default     = "Standard_F2"
  description = "(Required) Specifies the size of virtual machines in a scale set."
  type        = string
}

variable "sku_tier" {
  default     = "standard"
  type        = string
  description = "(Optional) Specifies the tier of virtual machines in a scale set. Possible values, standard or basic."
}




variable "custom_data" {
  type        = string
  description = "(Optional) Specifies custom data to supply to the machine. On linux-based systems, this can be used as a cloud-init script. On other systems, this will be copied as a file on disk. Internally, Terraform will base64 encode this value before sending it to the API. The maximum length of the binary array is 65535 bytes."
  default     = ""
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}











