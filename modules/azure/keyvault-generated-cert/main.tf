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
  name         = "${var.name}-generated-cert"
  key_vault_id = var.key_vault_id
  tags         = module.label.tags

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

    lifetime_action {
      action {
        action_type = var.action_type
      }

      trigger {
        days_before_expiry = var.days_before_expiry
      }
    }

    secret_properties {
      content_type = var.content_type
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = [var.dns_names]
      }

      subject            = var.subject
      validity_in_months = var.validity_in_months
    }
  }
}