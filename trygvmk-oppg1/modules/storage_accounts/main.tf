resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = replace(substr(var.storage_account_type, 0, 8), "_", "")  # Extract 'Standard' or 'Premium'
  account_replication_type = substr(var.storage_account_type, -3, 3) # Extract 'LRS' or 'GRS'
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}