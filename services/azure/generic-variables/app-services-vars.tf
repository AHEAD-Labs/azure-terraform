#APPS

# App service version
variable "App_Version" {
  description = "app version"
  default     = "V4.0"
}

variable "AI_Type" {
  type = string
}

variable "app_type" {
  type = string
}

variable "app_name" {
  type = string
}

variable "domain_abrv" {
  type = string
}

# main

variable "rg_location" {
  description = "Location of the rg"
  type        = string
}

variable "rg_name" {
  description = "name of the rg"
  type        = string
}


variable "application_name" {
  description = "Application name, e.g. 'app' or 'jenkins"
  type        = string
}


variable "delimiter" {
  default = "-"
}



variable "sku" {
  type        = string
  default     = "Basic"
  description = " (Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
}

variable "name" {

  type = string
}


variable "ip_restriction" {
  type = string
}
