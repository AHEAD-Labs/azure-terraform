variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "enforce_backend_pools_certificate_name_check" {
  description = "true or false"
  type        = string

}

variable "custom_https_provisioning_enabled" {
  description = "(Required) Name of the Frontend Endpoint."
  type        = string

}

variable "forwarding_protocol" {
  description = "(Required) Name of the Frontend Endpoint."
  type        = string

}

variable "backends" {
  type = any
  description = "A list of backend blocks to add to the frontdoor"
}


variable "health_probe_path" {
  type        = string
  description = "(Optional) The path to use for the Backend Health Probe. Default is /."
  default     = "/"
}

variable "health_probe_protocol" {
  type        = string
  description = "(Optional) Protocol scheme to use for the Backend Health Probe. Defaults to Http."
  default     = "Http"
}

variable "health_probe_interval" {
  type        = number
  description = "(Optional) The number of seconds between health probes. Defaults to 120."

}