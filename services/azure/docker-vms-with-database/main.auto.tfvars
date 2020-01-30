# The Tenant and Subscription you want to build infrastructure in
tenant          = "8734e533-05c7-4218-a322-115d77ce7536"
subscription_id = "8688fca6-f9ff-4c38-b2cb-b31972c4a1ad"

#region
location = "eastus"


# Database and SQL server settings
admin_email = "example@example.com"

# The AD admin for the SQL server
sql_object_id       = "fa2b1bf1-2eb7-42af-b924-e5f43834dcd7"
database_edition    = "Standard"
database_size       = "S1"
database_version    = "12.0"
administrator_login = "examplelogin"


# Storage account key: start, expiration date, and security
start      = "2020-01-13"
stop       = "2021-01-13"
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


# Key vault sku size
sku_name = "standard"

# the object id of the user or group needing access to keyvault
kv_object_id = "fa2b1bf1-2eb7-42af-b924-e5f43834dcd7"

# the object id of the the user or service principal running terraform, needs to be in place 
#for objects to be added to keyvault (ie secrets, certificates, etc )
provisioner_object_id = "fa2b1bf1-2eb7-42af-b924-e5f43834dcd7"


# Windows VM
os             = "2019-Datacenter"
os_offer       = "WindowsServer"
os_publisher   = "MicrosoftWindowsServer"
vm_size        = "Standard_DS1_v2"
vm_sku_tier    = "standard"

# Linux VM
publisher                        = "Canonical"
offer                            = "UbuntuServer"
sku                              = "18.04-LTS"
storage_image_reference_version  = "latest"
caching                          = "ReadWrite"
create_option                    = "FromImage"
managed_disk_type                = "Standard_LRS"

# Should be true when using an SSH key
disable_password_authentication  = false

# VM username
admin_username = "2020admin"

# VM disk termination policy
delete_data_disks_on_termination = true
delete_os_disk_on_termination    = true

# Network
address_space  = "10.0.0.0/8"
address_prefix = "10.0.2.0/24"
private_ip_address_allocation = "Dynamic"



