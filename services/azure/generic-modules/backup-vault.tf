module "vault" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/backup-vault"
  source              = "../../../modules/azure/backup-vault"
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  sku                 = "Standard"
}

module "backup-policy" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/backup-policy-vm"
  source              = "../../../modules/azure/backup-policy-vm"
  recovery_vault_name = module.vault.name
  resource_group_name = module.rg.resource_group_name
  frequency           = var.frequency
  time                = var.time
  daily_count         = var.daily_count
  weekly_count        = var.weekly_count
  weekly_weekdays     = var.weekly_weekdays
  monthly_count       = var.monthly_count
  monthly_weekdays    = var.monthly_weekdays
  monthly_weeks       = var.monthly_weeks
  yearly_count        = var.yearly_count
  yearly_weekdays     = var.yearly_weekdays
  yearly_weeks        = var.yearly_weeks
  yearly_months       = var.yearly_months
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  location            = var.location

}



#Variables

variable "frequency" {
  type = string
}

variable "time" {
  type = string
}

variable "daily_count" {
  type = string
}

variable "weekly_count" {
  type = string
}

variable "weekly_weekdays" {
  type = string
}

variable "monthly_count" {
  type = string
}

variable "monthly_weekdays" {
  type = string
}

variable "monthly_weeks" {
  type = string
}

variable "yearly_count" {
  type = string
}

variable "yearly_weekdays" {
  type = string
}

variable "yearly_weeks" {
  type = string
}

variable "yearly_months" {
  type = string
}