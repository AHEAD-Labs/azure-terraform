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

resource "azurerm_key_vault_certificate" "cert" {
  name         = var.name
  key_vault_id = var.key_vault_id
  tags         = module.label.tags

  certificate {
    contents = var.contents
    password = var.password
  }

  certificate_policy {
    issuer_parameters {
      name = "${var.name}-policy"
    }

    key_properties {
      exportable = var.exportable
      key_size   = var.key_size
      key_type   = var.key_type
      reuse_key  = var.reuse_key
    }

    secret_properties {
      content_type = var.content_type
    }
  }
}