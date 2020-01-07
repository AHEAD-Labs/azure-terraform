# The Tenant and Subscription you want to build infrastructure in
tenant          = ""
subscription_id = ""

#region
primary_location = "eastus"


# Database and SQL server settings
admin_email         = "example@example.com"
sql_object_id       = ""
database_edition    = "Standard"
database_size       = "S1"
database_version    = "12.0"
administrator_login = "examplelogin"


# Storage account key: start, expiration date, and security
start      = "YYYY-MM-DD"
stop       = "YYYY-MM-DD"
https_only = false

# Tagging Standards
business_unit    = "example"
project_name     = "example"
application_name = "example"
managed_by       = "example"
environment      = "example"
name             = "example"



# Storage account
account_tier             = "Standard"
account_replication_type = "GRS"
account_kind             = "StorageV2"


# Key Vault
# Key vault sku size
sku_name = "standard"
# the object id of the user or group needing access to keyvault
kv_object_id = ""
# the object id of the the user or service principal running terraform
provisioner_object_id = ""