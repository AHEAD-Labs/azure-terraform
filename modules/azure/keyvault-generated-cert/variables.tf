variable "name" {
  description = "(Required) Specifies the name of the Key Vault Certificate. Changing this forces a new resource to be created"
  type        = string
}

variable "key_vault_id" {
  description = "(Required) The ID of the Key Vault where the Certificate should be created."
  type        = string
}

variable "contents" {
  description = "(Required) The base64-encoded certificate contents. Changing this forces a new resource to be created."
  type        = string
}

variable "password" {
  description = "(Optional) The password associated with the certificate. Changing this forces a new resource to be created."
  type        = string
}

variable "exportable" {
  description = "(Required) Is this Certificate Exportable? Changing this forces a new resource to be created."
  type        = string
}

variable "key_size" {
  description = "(Required) The size of the Key used in the Certificate. Possible values include 2048 and 4096. Changing this forces a new resource to be created."
  type        = string
}

variable "key_type" {
  description = "(Required) Specifies the Type of Key, such as RSA. Changing this forces a new resource to be created."
  type        = string
}

variable "reuse_key" {
  description = " (Required) Is the key reusable? Changing this forces a new resource to be created."
  type        = string
}

variable "content_type" {
  description = "(Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or"
  type        = string
}

variable "action_type" {
  description = " "
  type        = string
}

variable "days_before_expiry" {
  description = " "
  type        = string
}

variable "dns_names" {
  description = "(Optional) A list of alternative DNS names (FQDNs) identified by the Certificate. Changing this forces a new resource to be created."
  type        = string
}

variable "subject" {
  description = "(Required) The Certificate's Subject. Changing this forces a new resource to be created."
  type        = string
}

variable "validity_in_months" {
  description = " (Required) The Certificates Validity Period in Months. Changing this forces a new resource to be created."
  type        = string
}

# Tags


variable "business_unit" {
  type        = string
  description = "Business unit for the project - Portal name or business unit name"
}

variable "location" {
  type = string
}

variable "project_name" {
  type        = string
  description = "Project name. e.g. 'Gov2Go'"
}

variable "application_name" {
  type        = string
  description = "Application name, e.g. 'app' or 'jenkins'"
}

variable "managed_by" {
  type        = string
  description = "Organization team name or group. e.g. 'ETS-SRE'"
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
  description = "Whether to create this resource or not?"
  default     = true
}







