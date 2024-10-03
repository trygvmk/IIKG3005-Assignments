output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_primary_access_key" {
  description = "Primary access key of the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_access_key
}
