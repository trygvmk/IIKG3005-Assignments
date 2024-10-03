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

  }
}

resource "azurerm_resource_group" "resource_groups" {
  for_each = toset(local.resource_group_names)
  name     = each.value
  location = var.location

  tags = local.tags
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = local.network_security_group_name
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_groups["${var.resource_owner}-rg-networking"].name

  tags = local.tags
}

resource "azurerm_virtual_network" "virtual_network" {
  count               = 2
  name                = "${local.virtual_network_name}-${count.index}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_groups["${var.resource_owner}-rg-networking"].name
  address_space       = ["10.0.${count.index}.0/24"]
  dns_servers         = ["10.0.${count.index}.4", "10.0.${count.index}.132"]

  subnet {
    name             = "subnet1-vnet${count.index}"
    address_prefixes = ["10.0.${count.index}.0/25"]
    security_group   = azurerm_network_security_group.network_security_group.id
  }

  subnet {
    name             = "subnet2-vnet${count.index}"
    address_prefixes = ["10.0.${count.index}.128/25"]
    security_group   = azurerm_network_security_group.network_security_group.id
  }

  tags = local.tags
}

resource "azurerm_storage_account" "storage_accounts" {
  count                    = 3
  name                     = "${local.storage_accounts_name}${count.index}"
  resource_group_name      = azurerm_resource_group.resource_groups["${var.resource_owner}-rg-storage_accounts"].name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}
