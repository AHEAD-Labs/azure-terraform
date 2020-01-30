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


