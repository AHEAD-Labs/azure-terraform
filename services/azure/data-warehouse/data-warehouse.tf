






module "kv" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
  source              = "../../../modules/azure/keyvault"
  resource_group_name = module.rg.resource_group_name
  tenant              = var.tenant
  location            = var.primary_location
  name                = "ahead2020"
  sku_name            = var.sku_name
  # The user/service princiapl account that is running terraform
  object_id = var.provisioner_object_id
  environment      = var.environment
  business_unit    = var.business_unit
  project_name     = var.project_name
  application_name = var.application_name
  managed_by       = var.managed_by
  attributes       = var.attributes
  tags             = var.tags

}

module "dbpw" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/generic/random-string"
  source  = "../../../modules/generic/random-string"
  length  = 32
  special = true
  upper   = false
  lower   = true
  number  = true

}



module "kv-secret-dbpw" {
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
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
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault"
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
  #source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/keyvault-access-policy"
  source = "../../../modules/azure/keyvault-access-policy"

  # The object_id that needs access to the keyvault
  object_id    = var.kv_object_id
  key_vault_id = module.kv.key_vault_id
  tenant       = var.tenant

}




module "sa" {
  #source      = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/storage-accounts"
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
  #source      = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/storage-accounts"
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


module "primary" {
  #source  = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/azure-sql"
  source                       = "../../../modules/azure/azure-sql"
  resource_group_name          = module.rg.resource_group_name
  name                         = var.name
  region                       = var.primary_location
  administrator_login_password = module.dbpw.result
  administrator_login          = var.administrator_login
  admin_email                  = var.admin_email
  object_id                    = var.sql_object_id
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

module "sql-db" {
  #source  = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/azure-sql"
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
  storage_endpoint           = module.sa.primary_blob_endpoint
  storage_account_access_key = module.sa.primary_access_key
  email_addresses            = [var.admin_email, ]
  retention_days             = 14
  state                      = "Enabled"

}