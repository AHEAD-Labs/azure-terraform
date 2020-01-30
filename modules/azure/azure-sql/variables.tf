
variable "resource_group_name" {
  type = string
}


variable "region" {
  description = "what region the server is in"
  type        = string
}



variable "admin_email" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

# Database Version
variable "database_version" {
  description = "Version for the database"
  type        = string
}

variable "administrator_login" {
  type = string
}

variable "administrator_login_password" {
  type = string
}


variable "name" {
  type = string
}


variable "object_id" {
  type = string
}



