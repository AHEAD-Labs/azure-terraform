variable "location" {
  description = "Location of the rg"
  type        = string
}

variable "resource_group_name" {
  description = "name of the rg"
  type        = string
}

variable "sku_name" {
  type = string

}


variable "tenant" {
  type = string

}


variable "object_id" {
  type = string

}

variable "name" {
  type = string

}

variable "virtual_network_subnet_ids" {
  type = string
}
