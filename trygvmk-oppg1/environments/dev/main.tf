terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  subscription_id = ""
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_names.resource_group_name
  location = var.location

  tags     = local.tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = local.resource_names.vnet_name
  subnet_name         = local.resource_names.subnet_name
}

module "storage_account" {
  source               = "../../modules/storage_accounts"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = local.resource_names.storage_account_name
  storage_account_type = local.storage_type_presets[var.storage_type_preset]
  container_name       = local.resource_names.container_name
}

module "vm" {
  source              = "../../modules/VMs"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_name             = local.resource_names.vm_name
  subnet_id           = module.network.subnet_id
  keyvault_secret_id  = module.key_vault.vm_credentials_secret_id
  vm_size             = local.vm_size_presets[var.vm_size_preset]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "key_vault" {
  source              = "../../modules/key_vault"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  key_vault_name      = local.resource_names.key_vault_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  storage_account_key = module.storage_account.storage_account_primary_access_key
}
