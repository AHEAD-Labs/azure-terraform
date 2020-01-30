
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

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace. Possible values are standard or premium. Changing this forces a new resource to be created."
}
