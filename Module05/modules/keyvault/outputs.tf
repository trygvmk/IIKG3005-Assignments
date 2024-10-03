output "keyvault_name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.kv.name
}

output "vm_credentials_secret_id" {
  description = "Secret ID for VM credentials"
  value       = azurerm_key_vault_secret.vm_credentials.id
}

output "storage_access_key_secret_id" {
  description = "Secret ID for Storage Access Key"
  value       = azurerm_key_vault_secret.storage_access_key_secret.id
}
