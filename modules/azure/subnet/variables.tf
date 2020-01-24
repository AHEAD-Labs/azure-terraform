
variable "business_unit" {
  description = "Business unit for the project - Portal name or business unit name"
  type        = string
}

variable "project_name" {
  description = "Project name. e.g. 'Gov2Go'"
  type        = string
}

variable "delimiter" {
  type    = string
  default = "-"
}

variable "enabled" {
  type        = bool
  description = "Whether to create this resource or not?"
  default     = true
}

variable "application_name" {
  description = "Application name, e.g. 'app' or 'jenkins"
  type        = string
}

variable "managed_by" {
  description = "Organization team name or group. e.g. "
  type        = string
}

variable "environment" {
  type = string
}

variable "resource_group_name" {
  type = string
}


variable "location" {
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

variable "name" {
  type = string
}
variable "address_prefix" {
  type = string
}

variable "address_space" {
  type = string
}



variable "virtual_network_name" {
  type = string
}

