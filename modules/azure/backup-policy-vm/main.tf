module "label" {
  source           = "../../generic/label"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  delimiter        = var.delimiter
  attributes       = var.attributes
  tags             = var.tags
  region           = var.location
  enabled          = var.enabled

}


resource "azurerm_recovery_services_protection_policy_vm" "vmpolicy" {
  name                = "backup-policy"
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name

  backup {
    frequency = var.frequency
    time      = var.time
  }

  retention_daily {
    count = var.daily_count
  }

  retention_weekly {
    count    = var.weekly_count
    weekdays = [var.weekly_weekdays]
  }

  retention_monthly {
    count    = var.monthly_count
    weekdays = [var.monthly_weekdays]
    weeks    = [var.monthly_weeks]
  }

  retention_yearly {
    count    = var.yearly_count
    weekdays = [var.yearly_weekdays]
    weeks    = [var.yearly_weeks]
    months   = [var.yearly_months]
  }
}



