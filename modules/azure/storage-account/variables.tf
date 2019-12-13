


variable "account_tier" {
  type = string

}

variable "account_replication_type" {
  type = string
}


variable "account_kind" {
  type = string
}

variable "enable_https_traffic_only" {
  type = string
}



variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
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

