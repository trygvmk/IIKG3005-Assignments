# General Variables
variable "resource_owner" {
  type        = string
  description = "Owner of the resources"
  default     = "trygvmk"
}

variable "company_name" {
  type        = string
  description = "Owner of the resources"
  default     = "operaterra"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "project" {
  type        = string
  description = "Project"
  default     = "Compulsory Assignment 1"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "West Europe"
}

# Storage Variables
variable "storage_type_preset" {
  description = "Preset for the type of the Storage Account. Allowed presets: standard_lrs, standard_grs, premium_lrs."
  type        = string
  default     = "standard_lrs"

  validation {
    condition     = contains(keys(local.storage_type_presets), var.storage_type_preset)
    error_message = "Invalid storage_type_preset. Allowed values are: ${join(", ", keys(local.storage_type_presets))}."
  }
}

# VM Variables
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size_preset" {
  description = "Preset for the size of the Virtual Machine. Allowed presets: small, medium, large."
  type        = string
  default     = "small"

  validation {
    condition     = contains(keys(local.vm_size_presets), var.vm_size_preset)
    error_message = "Invalid vm_size_preset. Allowed values are: ${join(", ", keys(local.vm_size_presets))}."
  }
}