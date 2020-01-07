

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
