terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = "4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend-tim"
    storage_account_name = "sabetfstimcfw8rawacd"
    container_name       = "tfstate"
    key                  = "web.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = ""
  features {}
}