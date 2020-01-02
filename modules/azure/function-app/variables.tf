#APPS

variable "ApplicationInsightsInstrumentationKey" {
  type = string
}

variable "APPINSIGHTS_INSTRUMENTATIONKEY" {
  type = string
}

variable "app_name" {
  type = string
}

variable "app_settings" {
  type    = map(string)
  default = {}
}

variable "value" {
  type = string
}

variable "frequency_interval" {
  type = string
}

variable "tier" {
  type = string
}

variable "size" {
  type = string
}


variable "frequency_unit" {
  type = string
}

# main


variable "location" {
  description = "Location of the app"
  type        = string
}

variable "resource_group_name" {
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



variable "sku" {
  type        = string
  default     = "Basic"
  description = " (Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
}

variable "name" {

  type = string
}




variable "storage_account_url" {
  type = string
}


