module "taproject" {
  #source = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/resource-group?ref=feature/resource-group"
  source           = "../../services/azure/azure-sql-database"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = var.name
  location         = var.location
  database_version = var.database_version
  kv_object_id = var.kv_object_id
  account_replication_type = var.account_replication_type
  https_only = var.https_only
  start = var.start
  account_tier = var.account_kind
  sku_name = var.sku_name
  subscription_id = var.subscription_id
  account_kind = var.account_kind
  stop = var.stop
  primary_location = var.primary_location
  database_edition = var.database_edition
  database_size = var.database_size
  tenant = var.tenant
  administrator_login = var.administrator_login
  sql_object_id = var.sql_object_id
  admin_email = var.admin_email
  provisioner_object_id = var.provisioner_object_id
}







# Main
variable "business_unit" {
  type        = string
  description = "Business unit for the project"
}

variable "subscription_id" {
  type = string
}

variable "tenant" {
  type = string
}





variable "project_name" {
  type        = string
  description = "Project name. e.g."
}

variable "application_name" {
  type        = string
  description = "Application name, e.g. 'app' or 'jenkins'"
}

variable "managed_by" {
  type        = string
  description = "Organization team name or group. e.g."
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
  description = "Whether to create this resource or not"
  default     = true
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "Central US"
}




variable "admin_email" {
  type = string
}




# Keyvault
variable "provisioner_object_id" {
  type = string
}

variable "kv_object_id" {
  type = string
}


# Locations
variable "primary_location" {
  type = string

}


# Storage Account

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "account_kind" {
  type = string
}


# Storage Account Key


variable "https_only" {
  type = string
}

variable "start" {
  type = string

}

variable "stop" {
  type = string


}






# SQL


variable "database_edition" {
  type = string
}

variable "database_version" {
  type = string
}


variable "database_size" {
  type = string
}

variable "administrator_login" {
  type = string
}

variable "sku_name" {
  type = string
}


variable "sql_object_id" {
  type = string
}
