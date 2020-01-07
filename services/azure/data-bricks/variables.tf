

# Main
variable "business_unit" {
  type        = string
  description = "Business unit for the project"
}

variable "subscription_id" {
  type = string
}



variable "project_name" {
  type        = string
  description = "Project name. e.g."
}

variable "application_name" {
  type        = string
  description = "Application name, e.g. 'app' or 'jenkins'"
}

variable "managed_by" {
  type        = string
  description = "Organization team name or group. e.g."
}

variable "environment" {
  type = string
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
  description = "Whether to create this resource or not"
  default     = true
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "Central US"
}




