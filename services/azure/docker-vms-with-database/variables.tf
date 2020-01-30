

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






variable "name" {
  type = string
}

variable "location" {
  type = string

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
