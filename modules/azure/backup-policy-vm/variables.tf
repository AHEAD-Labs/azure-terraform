variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string

}

variable "frequency" {
  type = string
}

variable "time" {
  type = string
}


variable "recovery_vault_name" {
  type = string
}

variable "daily_count" {
  type = string
}

variable "weekly_count" {
  type = string
}

variable "weekly_weekdays" {
  type = string
}

variable "monthly_count" {
  type = string
}

variable "monthly_weekdays" {
  type = string
}

variable "monthly_weeks" {
  type = string
}

variable "yearly_count" {
  type = string
}

variable "yearly_weekdays" {
  type = string
}

variable "yearly_weeks" {
  type = string
}

variable "yearly_months" {
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