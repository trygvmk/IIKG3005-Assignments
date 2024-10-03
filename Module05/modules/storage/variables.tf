variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}

variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
