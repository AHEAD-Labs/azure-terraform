module "app" {
  source           = "git@github.com/AHEAD-Labs/azure-terraform/tree/master/modules/azure/app-service"
  application_name = var.application_name
  name             = var.name
  rg_name          = module.rg.rg_name
  rg_location      = module.rg.rg_location
  ip_restriction   = module.appgw.public_ip_address
  AI_Type          = "web"
  app_name         = "app45"
  app_type         = "web"
  domain_abrv      = var.domain_abrv
  gw_ip            = module.appgw.public_ip_address
  domain           = var.domain
  dns-zone         = var.dns-zone
  depends          = module.appgw.public_ip_address
}