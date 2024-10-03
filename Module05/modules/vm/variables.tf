variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}

variable "subnet_id" {
  description = "ID of the Subnet"
  type        = string
}

variable "keyvault_secret_id" {
  description = "Secret ID from Key Vault for VM credentials"
  type        = string
}
