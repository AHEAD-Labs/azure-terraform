variable "business_unit" {
  type        = string
  description = "Business unit for the project - Portal name or business unit name"
}

variable "environment" {
  type        = string
  description = "Production = prd, Development = dev, Test = tst, Stage = stg, QA = qa, UAT = uat, Performance Test = pft , Demo = dem, Break Fix = bfx"
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

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `project_name`, `application_name`, `environment`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region to use for naming"
}
