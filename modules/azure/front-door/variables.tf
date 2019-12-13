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
  // https://github.com/hashicorp/terraform/issues/19898
  //  type = list(object({
  //    address     = string
  //    host_header = string
  //    http_port   = number
  //    https_port  = number
  //    priority    = number
  //    weight      = number
  //  }))
  description = "A list of backend blocks to add to the frontdoor"
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