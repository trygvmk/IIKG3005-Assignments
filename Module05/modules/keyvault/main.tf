resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
    ]
  }
}

# Secrets
resource "azurerm_key_vault_secret" "vm_credentials" {
  name         = "vm-credentials"
  value        = jsonencode({
    username = var.admin_username
    password = var.admin_password
  })
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "storage_access_key_secret" {
  name         = "storage-access-key"
  value        = var.storage_access_key
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_client_config" "current" {}
