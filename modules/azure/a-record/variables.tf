# Domain and DNS


variable "records" {
  type = string
}

variable "name" {
  type = string
}

variable "subscription_id" {
  type = string

}


variable "zone_name" {
  description = "Name of your DNS Zone"
  type        = string
  default     = "nicazure.com"
}

variable "ttl" {
  description = "time to life in seconds"
  type = number
}




variable "resource_group_name" {
  type = string

}

variable "tenant_id" {
  type = string

}

variable "client_id" {
  type = string

}

variable "client_secret" {
  type = string

}


variable "location" {
  description = "Location of the app"
  type        = string
}





