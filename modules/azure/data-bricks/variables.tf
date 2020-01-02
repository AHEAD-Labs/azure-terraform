
variable "name" {
  type        = string
  description = "name of the workspace"
}

variable "location" {
  type        = string
  description = "location of the workspace"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace. Possible values are standard or premium. Changing this forces a new resource to be created."
}


# label variables
variable "business_unit" {
  type        = string
  description = "Business unit for the project"
}

variable "project_name" {
  type        = string
  description = "Project name."
}

variable "application_name" {
  type        = string
  description = "Application name, e.g. 'app' or 'jenkins'"
}

variable "managed_by" {
  type        = string
  description = "Organization team name or group. e.g. "
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
