variable "subnet_id" {
  type = string
}

variable "path" {
  type = string
}

variable "disable_password_authentication" {
  type = string
}


variable "max_batch_instance_percent" {
  type = string
}
variable "max_unhealthy_instance_percent" {
  type = string
}
variable "max_unhealthy_upgraded_instance_percent" {
  type = string
}
variable "pause_time_between_batches" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}



# main
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

variable "enabled" {
  type        = bool
  description = "Whether to create this resource or not?"
  default     = true
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

variable "name" {
  type = string
}

variable "address_space" {
  type = string
}

variable "address_prefix" {
  type = string
}

variable "upgrade_policy_mode" {
  description = "(Required) Specifies the mode of an upgrade to virtual machines in the scale set. Possible values, Rolling, Manual, or Automatic. When choosing Rolling, you will need to set a health probe."
  type        = string
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

variable "capacity" {
  type        = number
  description = "(Required) Specifies the number of virtual machines in the scale set."
  default     = 2
}

variable "computer_name_prefix" {
  type        = string
  description = "(Required) Specifies the computer name prefix for all of the virtual machines in the scale set. Computer name prefixes must be 1 to 9 characters long for windows images and 1 - 58 for linux. Changing this forces a new resource to be created."
}

variable "custom_data" {
  type        = string
  description = "(Optional) Specifies custom data to supply to the machine. On linux-based systems, this can be used as a cloud-init script. On other systems, this will be copied as a file on disk. Internally, Terraform will base64 encode this value before sending it to the API. The maximum length of the binary array is 65535 bytes."
  default     = ""
}

variable "allow_http" {
  type        = bool
  description = "Whether to allow http traffic in to the nsg"
  default     = true
}

variable "public_key" {
  type        = string
  description = "ssh public key to use with the instances"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}

variable "automatic_os_upgrade" {
  type = string
}










