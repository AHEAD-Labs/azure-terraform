
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