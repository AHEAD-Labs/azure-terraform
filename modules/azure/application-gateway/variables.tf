### Application Gateway ####

variable "cert_name" {
  type = string
}


variable "cert_pw" {
  type = string
}

variable "cert" {
  type        = string
  description = "Base64 string of the cert"
}

# resource group

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_name" {
  type = string
}

variable "vnet_space" {

  description = "vnet cidr block"
  default     = "10.0.0.0/16"
}

variable "subnet_space" {

  description = "virtual network cidr block"
  default     = "10.0.0.0/24"
}

variable "domain" {
  type = string

}






