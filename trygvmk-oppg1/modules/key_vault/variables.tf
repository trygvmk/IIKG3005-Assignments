variable "key_vault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "location" {
  type        = string
  description = "Deployment location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
  sensitive   = true
}

variable "storage_account_key" {
  type        = string
  description = "Storage account key"
  sensitive   = true
}