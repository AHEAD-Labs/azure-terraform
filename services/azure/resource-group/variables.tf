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
  type = string

  validation {
    condition     = contains(["qa", "dev", "prod"], var.environment)
    error_message = "Argument \"environment\" must be either \"qa\", \"dev\", or \"prod\"."
  }
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

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "enabled" {
  type        = bool
  description = "Whether to create this resource or not?"
  default     = true
}