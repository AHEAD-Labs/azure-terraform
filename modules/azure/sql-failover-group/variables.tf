variable "resource_group_name" {
  type = string
}

variable "server_name" {
  type = string
}

variable "databases" {
  type    = list(string)
}
variable "mode" {
  type = string
}

variable "grace_minutes" {
  type = string
}

variable "id" {
  type = string
}

variable "name" {
  type = string
}