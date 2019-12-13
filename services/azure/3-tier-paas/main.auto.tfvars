# The Tenant and Subscription you want to build infrastructure in
tenant          = ""
subscription_id = ""

#Primary region and Failover Region
primary_location   = "eastus"
secondary_location = "westus"

# Database and SQL server settings
admin_email         = ""
object_id           = ""
database_edition    = "Standard"
database_size       = "S1"
database_version    = "12.0"
administrator_login = ""

# true for custom domain, false for 
enforce_backend_pools_certificate_name_check = false
custom_https_provisioning_enabled            = false

# Storage account key: start, expiration date, and security
start      = "2019-09-21"
stop       = "2020-03-21"
https_only = false

# Tagging Standards
business_unit    = ""
project_name     = ""
application_name = ""
managed_by       = ""
environment      = ""
name             = ""

# Application and app insights
#App type
application_type = "web"
# Back up frequency
frequency_interval = "1"
frequency_unit     = "Day"
# Size
tier = "Standard"
size = "S1"

# Storage account
account_tier             = "Standard"
account_replication_type = "GRS"
account_kind             = "StorageV2"

# Keyvault

kv_object_id = ""
  