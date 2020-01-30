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

variable "location" {
  description = "Location of the app"
  type        = string
}

variable "resource_group_name" {
  type = string
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


