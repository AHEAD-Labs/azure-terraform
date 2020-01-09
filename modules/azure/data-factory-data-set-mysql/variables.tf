
variable "name" {
  type        = string
  description = "name of the workspace"
}

variable "location" {
  type        = string
  description = "location of the workspace"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "data_factory_name" {
  description = "The Data Factory name in which to associate the Dataset with. Changing this forces a new resource."
  type        = string
}

variable "connection_string" {
  description = "connection string for database access"
  type        = string
}

