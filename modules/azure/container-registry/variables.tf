

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "admin_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = " (Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
}

variable "georeplication_locations" {
  type        = list(string)
  default     = []
  description = " (Optional) A list of Azure locations where the container registry should be geo-replicated."
}

