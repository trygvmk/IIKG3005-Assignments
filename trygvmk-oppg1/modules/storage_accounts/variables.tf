variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "container_name" {
  type        = string
  description = "Name of the storage container"
}

variable "storage_account_type" {
  description = "Type of the Storage Account (e.g., Standard_LRS)"
  type        = string
}

variable "location" {
  type        = string
  description = "Deployment location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}