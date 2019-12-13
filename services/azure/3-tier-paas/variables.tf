


#APPS

variable "frequency_interval" {
  type = string
}

variable "frequency_unit" {
  type = string
}

variable "application_type" {
  type = string
}

variable "tier" {
  type = string
}

variable "size" {
  type = string
}




# Backups

variable "frequency" {
  default = "1"
}
variable "unit" {
  default = "Day"
}
variable "keep_backup" {
  default = true
}
variable "retention" {
  default = "3"
}



# main

variable "tenant" {
  type = string
}

variable "subscription_id" {
  type = string
}


variable "business_unit" {
  description = "Business unit for the project - Portal name or business unit name"
  type        = string
}

variable "project_name" {
  description = "Project name. e.g. 'Gov2Go'"
  type        = string
}

variable "application_name" {
  description = "Application name, e.g. 'app' or 'jenkins"
  type        = string
}

variable "managed_by" {
  description = "Organization team name or group. e.g. 'ETS-SRE'"
  type        = string
}

variable "environment" {
  type = string
}


variable "delimiter" {
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
  description = "Whether to create this resource or not?"
  default     = true
}


variable "admin_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether the admin user is enabled. Defaults to false."
}

variable "sku_name" {
  type        = string
  default     = "standard"
  description = " (Optional) The SKU name of the the container registry. Possible values are Basic, Standard and Premium."
}

variable "name" {
  type = string


}

variable "admin_email" {
  type = string
}


variable "object_id" {
  type = string
}


# Keyvault

variable "kv_object_id" {
  type = string
}


# Locations
variable "primary_location" {
  type = string

}

variable "secondary_location" {
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


# Front Door

variable "enforce_backend_pools_certificate_name_check" {
  type = string
}

variable "custom_https_provisioning_enabled" {
  type = string
}




