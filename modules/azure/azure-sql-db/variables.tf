variable "storage_endpoint" {
  type        = string
  description = "Specifies the blob storage endpoint (e.g. https://MyAccount.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs. Required if state is Enabled."
}

variable "location" {
  type = string

}

variable "server_name" {
  description = "The name of the SQL Server on which to create the database."
  type        = string
}


variable "storage_account_access_key" {
  description = " (Optional) Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled."
  type        = string

}

variable "resource_group_name" {
  type = string
}

variable "database_version" {
  description = "Version for the database"
  type        = string
}

# Database Edition
variable "database_edition" {
  description = "edition for database"
  type        = string
}

# Database Size
variable "database_size" {
  description = "size for database"
  type        = string
}

variable "name" {
  type = string
}

variable "email_addresses" {
  type    = list(string)
  default = []

}

variable "email_account_admins" {
  type    = string
  default = "Enabled"
}

variable "use_server_default" {
  type    = string
  default = "Enabled"
}


variable "retention_days" {
  description = "(Optional) Specifies the number of days to keep in the Threat Detection audit logs."
  type        = string
}

variable "state" {

  description = "The State of the Policy. Possible values are Enabled, Disabled or New."
  type        = string
}
