variable "rg_name" {
  type = string
}

variable "key_vault_id" {
  type = string
}



variable "admin_email" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "tenant_id" {
  type = string
}

# Database Version
variable "Database_Version" {
  description = "Version for the database"
  type        = string
}

# Database username
variable "Database_UserName" {
  description = "UserName for database"
  type        = string
}

# Database Edition
variable "Database_Edition" {
  description = "edition for database"
  type        = string
}

# Database Size
variable "Database_Size" {
  description = "size for database"
  type        = string
}

# Default location 
variable "location" {
  description = "Everything Will be put in this location"
  type        = string
}


variable "name" {
  type = string
}


variable "sql_admin_id" {
  type = string
}


#variable "storage_endpoint" {
# type = string
#}


