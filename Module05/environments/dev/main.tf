# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Network Module
module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
}

# Storage Account Module
module "storage" {
  source              = "../../modules/storage"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  storage_account_name = var.storage_account_name
  storage_account_tier = var.storage_account_tier
  storage_account_kind = var.storage_account_kind
}

# Key Vault Module
module "keyvault" {
  source              = "../../modules/keyvault"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  keyvault_name       = var.keyvault_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  storage_access_key  = module.storage.storage_account_primary_access_key
}

# Virtual Machine Module
module "vm" {
  source              = "../../modules/vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  keyvault_secret_id  = module.keyvault.vm_credentials_secret_id
}
