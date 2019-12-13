#############Log Analytics##############################

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
resource "random_string" "appinsights" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "azurerm_log_analytics_workspace" "logsworkspace" {
  name                = "${random_string.appinsights.result}-loganalytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerNode"
  retention_in_days   = var.logretentionPolicy
  tags                = module.label.tags
}

resource "azurerm_log_analytics_solution" "Security" {
  solution_name         = "Security"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }
}

resource "azurerm_log_analytics_solution" "AgentHealthAssessment" {
  solution_name         = "AgentHealthAssessment"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name


  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AgentHealthAssessment"
  }
}

resource "azurerm_log_analytics_solution" "ChangeTracking" {
  solution_name         = "ChangeTracking"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name


  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_solution" "Updates" {
  solution_name         = "Updates"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }
}

resource "azurerm_log_analytics_solution" "AzureAutomation" {
  solution_name         = "AzureAutomation"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAutomation"
  }
}

resource "azurerm_log_analytics_solution" "ADAssessment" {
  solution_name         = "ADAssessment"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ADAssessment"
  }
}

resource "azurerm_log_analytics_solution" "SQLAssessment" {
  solution_name         = "SQLAssessment"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SQLAssessment"
  }
}

resource "azurerm_log_analytics_solution" "ServiceMap" {
  solution_name         = "ServiceMap"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "AzureAppGatewayAnalytics" {
  solution_name         = "AzureAppGatewayAnalytics"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureAppGatewayAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "AzureNSGAnalytics" {
  solution_name         = "AzureNSGAnalytics"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureNSGAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "KeyVaultAnalytics" {
  solution_name         = "KeyVaultAnalytics"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "ContainerInsights" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_log_analytics_solution" "AzureActivity" {
  solution_name         = "AzureActivity"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.logsworkspace.id
  workspace_name        = azurerm_log_analytics_workspace.logsworkspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }
}

################Backup Vault###################

resource "azurerm_recovery_services_vault" "backupvault" {
  name                = "${var.name}${random_string.appinsights.result}BackupVault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_recovery_services_protection_policy_vm" "backuppolicy" {
  name                = var.backupPolicyName
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.backupvault.name

  timezone = var.timeZone

  backup {
    frequency = "Weekly"
    time      = var.scheduleRunTimes
    weekdays  = var.scheduleRunDays
  }

  retention_weekly {
    count    = var.weeklyRetentionDurationCount
    weekdays = var.scheduleRunDays
  }

  retention_monthly {
    count    = var.monthlyRetentionDurationCount
    weekdays = var.daysOfTheWeekForMontlyRetention
    weeks    = var.weeksOfTheMonthForMonthlyRetention
  }

  retention_yearly {
    count    = var.yearlyRetentionDurationCount
    weekdays = var.daysOfTheWeekForYearlyRetention
    weeks    = var.weeksOfTheMonthForYearlyRetention
    months   = var.monthsOfYear
  }
}