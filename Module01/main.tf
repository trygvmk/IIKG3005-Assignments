terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.116.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "trygvmk-fd-rg" {
  name     = "trygvmk-rg-demo-we"
  location = "West Europe"
}

resource "azurerm_storage_account" "trygvmk-sa-demo" {
  name                     = "trygvmkdemo210824"
  resource_group_name      = azurerm_resource_group.trygvmk-fd-rg.name
  location                 = azurerm_resource_group.trygvmk-fd-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}