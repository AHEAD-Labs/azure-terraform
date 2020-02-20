

variable "name" {
  type = string
}

variable "location" {
  type = string

}

variable "tags_list" {
    type    = list(string)
    default = []
  
}

variable "enabled" {
  type        = bool
  description = "Whether to create this resource or not?"
  default     = true
}
