# Storage account


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

variable "default_action" {
  type = string
}




variable "virtual_network_subnet_ids" {
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

