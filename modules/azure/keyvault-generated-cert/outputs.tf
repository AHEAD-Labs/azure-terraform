output "id" {
  description = "The Key Vault Certificate ID."
  value       = azurerm_key_vault_certificate.cert.id
}

output "secret_id" {
  description = "The ID of the associated Key Vault Secret."
  value       = azurerm_key_vault_certificate.cert.secret_id
}

output "version" {
  description = "The current version of the Key Vault Certificate."
  value       = azurerm_key_vault_certificate.cert.version
}

output "certificate_data" {
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
  value       = azurerm_key_vault_certificate.cert.certificate_data
}

output "thumbprint" {
  description = "The X509 Thumbprint of the Key Vault Certificate represented as a hexadecimal string. "
  value       = azurerm_key_vault_certificate.cert.thumbprint
}
