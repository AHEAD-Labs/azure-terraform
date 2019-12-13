variable "name" {
  type = string
}


variable "location" {
  description = "Location of the rg"
  type        = string
}

variable "resource_group_name" {
  description = "name of the rg"
  type        = string
}
#############Log Analytics#######################
variable "logretentionPolicy" {
  description = "Number of days to retain diagnostic logs, zero stores the logs indefinitely"
  default     = 180
}

#############Backup Vault########################

variable "backupretentionPolicy" {
  default = 180
}

variable "backupPolicyName" {
  default = "WeeklyBackupPolicy1"
}

variable "scheduleRunDays" {
  default = ["Sunday", "Tuesday", "Thursday"]
}

variable "scheduleRunTimes" {
  default = "05:30"
}

variable "timeZone" {
  default = "UTC"
}

variable "weeklyRetentionDurationCount" {
  default = 104
}

variable "daysOfTheWeekForMontlyRetention" {
  default = ["Sunday", "Tuesday"]
}

variable "weeksOfTheMonthForMonthlyRetention" {
  default = ["First", "Third"]
}

variable "monthlyRetentionDurationCount" {
  default = 60
}

variable "monthsOfYear" {
  default = ["January", "March", "August"]
}

variable "daysOfTheWeekForYearlyRetention" {
  default = ["Sunday", "Tuesday"]
}

variable "weeksOfTheMonthForYearlyRetention" {
  default = ["First", "Third"]
}

variable "yearlyRetentionDurationCount" {
  default = 10
}


variable "business_unit" {
  type        = string
  description = "Business unit for the project - Portal name or business unit name"
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
