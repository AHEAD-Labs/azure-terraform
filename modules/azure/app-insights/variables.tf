#APPS


variable "application_type" {
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





variable "sku" {
  type        = string
  default     = "Basic"
  description = " (Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
}





