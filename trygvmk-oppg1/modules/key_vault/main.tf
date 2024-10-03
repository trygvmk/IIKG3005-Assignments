data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  purge_protection_enabled    = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    storage_permissions = [
      "Get",
      "List",
      "Delete",
      "Set",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "Purge",
      "List",
      "Restore",
      "Recover",
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_secret" {
  name = "vm-credentials"
  value = jsonencode({
    username = var.admin_username
    password = var.admin_password
  })
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "storage_account_secret" {
  name         = "storage-account-key"
  value        = var.storage_account_key
  key_vault_id = azurerm_key_vault.key_vault.id
}