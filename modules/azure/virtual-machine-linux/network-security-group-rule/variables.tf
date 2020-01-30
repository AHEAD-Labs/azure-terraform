
# Network Security Group
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
variable "prefix" {
  type = string
}

variable "priority" {
  type = string
}

variable "destination_address_prefix" {
  description = "(Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if"
  type        = string
}

variable "direction" {
  description = "- (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
  type        = string
}

variable "access" {
  description = "(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
  type        = string
}

variable "protocol" {
  description = " (Required) Network protocol this rule applies to. Possible values include Tcp, Udp or * (which matches both)."
  type        = string
  default     = "Tcp"
}

variable "source_port_range" {
  description = "(Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
  type        = string
}

variable "destination_port_range" {
  description = "- (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
  type        = string
  default     = "*"
}

variable "source_address_prefix" {
  description = "(Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
  type        = string
}

variable "network_security_group_name" {
  type = string
}
