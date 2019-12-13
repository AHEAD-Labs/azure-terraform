module "appgw" {
  source      = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/application-gateway"
  app_name    = "app45"
  domain      = var.domain
  cert_pw     = "test"
  cert        = "cert\test"
  rg_name     = module.rg.rg_name
  rg_location = module.rg.rg_location
}