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

resource "time_static" "epoch" {}

locals {
  resource_group_name = "${var.resource_group_name}-${time_static.epoch.unix}"
}

resource "azurerm_resource_group" "rg-main" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_network_security_group" "nsg-main" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.rg-main.location
  resource_group_name = azurerm_resource_group.rg-main.name
}

resource "azurerm_virtual_network" "vnet-main" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg-main.location
  resource_group_name = azurerm_resource_group.rg-main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = var.subnet1_name
    address_prefixes = ["10.0.3.0/24"]
  }

  subnet {
    name             = var.subnet2_name
    address_prefixes = ["10.0.4.0/24"]
    security_group   = azurerm_network_security_group.nsg-main.id
  }

  tags = {
    environment = "Development"
  }
}