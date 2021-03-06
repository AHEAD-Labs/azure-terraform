variable "subscription_id" {
  type        = string
  description = "The subscription to create this resource in"
}

variable "business_unit" {
  type        = string
  description = "Business unit for the project - Portal name or business unit name"
}

variable "project_name" {
  type        = string
  description = "Project name. e.g. 'Gov2Go'"
}

variable "application_name" {
  type        = string
  description = "Application name, e.g. 'app' or 'jenkins'"
}

variable "managed_by" {
  type        = string
  description = "Organization team name or group. e.g. 'ETS-SRE'"
}

variable "environment" {
  type    = string
  default = "default"
}

variable "delimiter" {
  type    = string
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

variable "state_storage_name" {
  type        = string
  description = "The location (s3 bucket for now) of the remote state"
}

variable "state_location" {
  type        = string
  description = "The geo location (s3 region) of the remote state"
}

variable "state_key" {
  type        = string
  description = "The key in the remote state storage to look for"
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

variable "name" {
  type = string
}

variable "georeplication_locations" {
  type        = list(string)
  default     = []
  description = " (Optional) A list of Azure locations where the container registry should be geo-replicated."
}
