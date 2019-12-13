module "appgw" {
  source      = "git::ssh://git@ssh.dev.azure.com/v3/NIC-Cloud-Team/nic-terraform-modules/nic-terraform-modules//modules/azure/application-gateway"
  app_name    = "app45"
  domain      = var.domain
  cert_pw     = "test"
  cert        = "cert\test"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}