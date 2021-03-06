variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  type = string
}


variable "probe_enabled" {
  type        = bool
  description = "Whether to create this probe resource or not?"
  default     = true
}

variable "lb_probe_path" {
  type        = string
  default     = null
  description = " (Optional) The URI used for requesting health status from the backend endpoint. Required if protocol is set to Http. Otherwise, it is not allowed."
}

variable "lb_probe_interval" {
  description = "Interval in seconds the load balancer health probe rule does a check"
  default     = 5
}

variable "protocol" {
  description = "http or https"
  type        = string
}

variable "remote_port" {
  description = "Protocols to be used for remote vm access. [protocol, backend_port].  Frontend port will be automatically generated starting at 50000 and in the output."
  default = {
    ssh = ["Tcp", "22"]
  }
}

variable "lb_port" {
  description = "Protocols to be used for lb health probes and rules. [frontend_port, protocol, backend_port]"
  default = {
    http = ["80", "Tcp", "80"]
  }
}

variable "frontend_name" {
  description = "(Required) Specifies the name of the frontend ip configuration."
  default     = "PublicIPAddress"
}

variable "lb_probe_unhealthy_threshold" {
  description = "Number of times the load balancer health probe has an unsuccessful attempt before considering the endpoint unhealthy."
  default     = 2
}
