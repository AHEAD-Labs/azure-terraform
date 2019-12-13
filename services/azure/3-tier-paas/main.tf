provider "azurerm" {
  version         = "~> 1.33"
  subscription_id = var.subscription_id
}

module "rg" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/resource-group"
  source           = "../../../modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = "main-rg"
  location         = var.primary_location
}

module "rg2" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/resource-group"
  source           = "../../../modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = "logs-rg"
  location         = var.primary_location
}

module "rg3" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/resource-group"
  source           = "../../../modules/azure/resource-group"
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  name             = "security-rg"
  location         = var.primary_location
}


module "app-insights" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/app-insights"
  source              = "../../../modules/azure/app-insights"
  resource_group_name                   = module.rg2.resource_group_name
  application_type    = var.application_type
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags
  location            = var.primary_location
}




module "app" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/app-service"
  source                                = "../../../modules/azure/app-service"
  name                                  = var.name
  resource_group_name                   = module.rg.resource_group_name
  business_unit                         = var.business_unit
  project_name                          = var.project_name
  application_name                      = var.application_name
  managed_by                            = var.managed_by
  environment                           = var.environment
  attributes                            = var.attributes
  tags                                  = var.tags
  tier                                  = var.tier
  size                                  = var.size
  location                              = var.primary_location
  frequency_interval                    = var.frequency_interval
  frequency_unit                        = var.frequency_unit
  ip_address                            = "147.243.0.0"
  subnet_mask                           = "255.255.0.0"
  ApplicationInsightsInstrumentationKey = module.app-insights.instrumentation_key
  APPINSIGHTS_INSTRUMENTATIONKEY        = module.app-insights.instrumentation_key
  value                                 = "Server=tcp:${module.primary.fully_qualified_domain_name},1433;Initial Catalog=${module.sql-db.name};Persist Security Info=False;User ID=${module.dbpw.result};Password=${var.administrator_login};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  storage_account_url                   = "https://${module.sa.storage_account_name}.blob.core.windows.net/${module.app-container.name}${module.sa-key.sas_url_query_string}&sr=b"



}


module "app2" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/app-service"
  source                                = "../../../modules/azure/app-service"
  name                                  = var.name
  resource_group_name                   = module.rg.resource_group_name
  business_unit                         = var.business_unit
  project_name                          = var.project_name
  application_name                      = var.application_name
  managed_by                            = var.managed_by
  environment                           = var.environment
  attributes                            = var.attributes
  tags                                  = var.tags
  tier                                  = var.tier
  size                                  = var.size
  location                              = var.secondary_location
  frequency_interval                    = var.frequency_interval
  frequency_unit                        = var.frequency_unit
  ip_address                            = "147.243.0.0"
  subnet_mask                           = "255.255.0.0"
  ApplicationInsightsInstrumentationKey = module.app-insights.instrumentation_key
  APPINSIGHTS_INSTRUMENTATIONKEY        = module.app-insights.instrumentation_key
  value                                 = "Server=tcp:${module.primary.fully_qualified_domain_name},1433;Initial Catalog=${module.sql-db.name};Persist Security Info=False;User ID=${module.dbpw.result};Password=${var.administrator_login};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  storage_account_url                   = "https://${module.sa.storage_account_name}.blob.core.windows.net/${module.app-container.name}${module.sa-key.sas_url_query_string}&sr=b"



}

module "kv" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/keyvault"
  source              = "../../../modules/azure/keyvault"
  resource_group_name = module.rg.resource_group_name
  tenant              = var.tenant
  location            = var.primary_location
  name                = var.name
  sku_name            = var.sku_name
  # The object_id that needs access to the keyvault
  object_id        = var.kv_object_id
  environment      = var.environment
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  attributes       = var.attributes
  tags             = var.tags

}

module "dbpw" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/generic/random-string"
  source  = "../../../modules/generic/random-string"
  length  = 32
  special = true
  upper   = false
  lower   = true
  number  = true

}



module "kv-secret-dbpw" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "db-password"
  value            = module.dbpw.result
  key_vault_id     = module.kv.key_vault_id
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  location         = var.primary_location
}


module "kv-secret-dbusername" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/keyvault"
  source           = "../../../modules/azure/keyvault-secret"
  name             = "db-username"
  value            = var.administrator_login
  key_vault_id     = module.kv.key_vault_id
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  environment      = var.environment
  attributes       = var.attributes
  tags             = var.tags
  location         = var.primary_location
}



module "kv-policy" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/keyvault-access-policy"
  source = "../../../modules/azure/keyvault-access-policy"
  tenant = var.tenant
  # The object_id that needs access to the keyvault
  object_id    = "d0ec3427-7f1f-48d0-8884-991080a68ec0"
  key_vault_id = module.kv.key_vault_id

}

module "sa" {
  #source      = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/storage-accounts"
  source                    = "../../../modules/azure/storage-account"
  resource_group_name       = module.rg.resource_group_name
  location                  = var.primary_location
  name                      = var.name
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  enable_https_traffic_only = true
  business_unit             = var.business_unit
  project_name              = var.project_name
  application_name          = var.application_name
  managed_by                = var.managed_by
  environment               = var.environment
  attributes                = var.attributes
  tags                      = var.tags
}


module "sa-db-primary" {
  #source      = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/storage-accounts"
  source                    = "../../../modules/azure/storage-account"
  resource_group_name       = module.rg.resource_group_name
  location                  = var.primary_location
  name                      = var.name
  account_tier              = var.account_tier
  account_replication_type  = "LRS"
  account_kind              = var.account_kind
  enable_https_traffic_only = false
  business_unit             = var.business_unit
  project_name              = var.project_name
  application_name          = var.application_name
  managed_by                = var.managed_by
  environment               = var.environment
  attributes                = var.attributes
  tags                      = var.tags
}




module "sa-key" {
  #source      = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/storage-accounts"
  source            = "../../../modules/azure/storage-account-key"
  start             = var.start
  stop              = var.stop
  https_only        = var.https_only
  connection_string = module.sa.connection_string
  service           = true
  container         = true
  object            = true
  blob              = true
  queue             = true
  table             = true
  file              = true
  read              = true
  write             = true
  delete            = true
  list              = true
  add               = true
  create            = true
  update            = true
  process           = true
}


module "app-container" {
  #source           = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/container"
  source               = "../../../modules/azure/container"
  storage_account_name = module.sa.storage_account_name
  name                 = "appbackups"
  location             = module.rg2.rg_location
  business_unit        = var.business_unit
  project_name         = var.project_name
  application_name     = var.application_name
  managed_by           = var.managed_by
  environment          = var.environment
  attributes           = var.attributes
  tags                 = var.tags

}

module "la" {
  #source      = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/log-analytics"
  source              = "../../../modules/azure/log-analytics"
  resource_group_name = module.rg2.resource_group_name
  location            = module.rg2.rg_location
  name                = var.name
  business_unit       = var.business_unit
  project_name        = var.project_name
  application_name    = var.application_name
  managed_by          = var.managed_by
  environment         = var.environment
  attributes          = var.attributes
  tags                = var.tags



}

module "primary" {
  #source  = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/azure-sql"
  source                       = "../../../modules/azure/azure-sql"
  resource_group_name          = module.rg.resource_group_name
  name                         = var.name
  region                       = var.primary_location
  administrator_login_password = module.dbpw.result
  administrator_login          = var.administrator_login
  admin_email                  = var.admin_email
  object_id                    = var.object_id
  database_version             = var.database_version
  location                     = var.primary_location
  tenant_id                    = var.tenant
  business_unit                = var.business_unit
  project_name                 = var.project_name
  application_name             = var.application_name
  managed_by                   = var.managed_by
  environment                  = var.environment
  attributes                   = var.attributes
  tags                         = var.tags


}

module "secondary" {
  #source  = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/azure-sql"
  source                       = "../../../modules/azure/azure-sql"
  resource_group_name          = module.rg.resource_group_name
  name                         = "${var.name}-2"
  region                       = var.secondary_location
  administrator_login_password = module.dbpw.result
  administrator_login          = var.administrator_login
  admin_email                  = var.admin_email
  object_id                    = var.object_id
  database_version             = var.database_version
  location                     = var.secondary_location
  tenant_id                    = var.tenant
  business_unit                = var.business_unit
  project_name                 = var.project_name
  application_name             = var.application_name
  managed_by                   = var.managed_by
  environment                  = var.environment
  attributes                   = var.attributes
  tags                         = var.tags




}

module "sql-db" {
  #source  = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/azure-sql"
  source                     = "../../../modules/azure/azure-sql-db"
  resource_group_name        = module.rg.resource_group_name
  business_unit              = var.business_unit
  project_name               = var.project_name
  application_name           = var.application_name
  managed_by                 = var.managed_by
  environment                = var.environment
  attributes                 = var.attributes
  tags                       = var.tags
  database_version           = var.database_version
  database_edition           = var.database_edition
  database_size              = var.database_size
  location                   = var.primary_location
  server_name                = module.primary.name
  name                       = var.name
  storage_endpoint           = module.sa-db-primary.primary_blob_endpoint
  storage_account_access_key = module.sa-db-primary.primary_access_key
  email_addresses            = [var.admin_email, ]
  retention_days             = 14
  state                      = "Enabled"

}

module "sql-failover-group" {
  #source  = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/sql-failover-group"
  source              = "../../../modules/azure/sql-failover-group"
  resource_group_name = module.rg.resource_group_name
  name                = var.name
  mode                = "Automatic"
  grace_minutes       = 60
  id                  = module.secondary.id
  server_name         = module.primary.name
  databases           = [module.sql-db.id]
}


module "front-door" {
  #source                                       = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/front-door?ref=v0.1.6"
  source                                       = "../../../modules/azure/front-door"
  business_unit                                = var.business_unit
  project_name                                 = var.project_name
  managed_by                                   = var.managed_by
  environment                                  = var.environment
  attributes                                   = var.attributes
  tags                                         = var.tags
  application_name                             = var.application_name
  name                                         = var.name
  resource_group_name                          = module.rg3.resource_group_name
  location                                     = var.location
  enforce_backend_pools_certificate_name_check = var.enforce_backend_pools_certificate_name_check
  custom_https_provisioning_enabled            = var.custom_https_provisioning_enabled
  backends = [{
    address  = module.app.hostname
    priority = 1
    }, {
    address  = module.app2.hostname
    priority = 2
  }]


  forwarding_protocol   = "MatchRequest"
  health_probe_interval = 15
}







