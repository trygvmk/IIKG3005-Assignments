terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = "4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend-trygvmk"
    storage_account_name = "uhfpiuafhiug349ijf"
    container_name       = "tfstate"
    key                  = "web.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}