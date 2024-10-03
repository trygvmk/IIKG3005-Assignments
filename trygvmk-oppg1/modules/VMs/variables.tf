variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "location" {
  type        = string
  description = "Deployment location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vm_size" {
  description = "Size of the Virtual Machine (e.g., Standard_DS1_v2)"
  type        = string
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
}

variable "keyvault_secret_id" {
  description = "Secret ID from Key Vault for VM credentials"
  type        = string
}