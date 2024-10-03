variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "resource_owner" {
  type        = string
  description = "Owner of the resources"
  default     = "trygvmk"
}

variable "resource_group_names" {
  type        = list(string)
  description = "Name of the resource group"
  default     = ["demo"]
}

variable "company_name" {
  type        = string
  description = "Name of the company"
  default     = "IT Company"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "dev"
}

variable "billing_department" {
  type        = string
  description = "Billing department"
  default     = "IT"
}

variable "project" {
  type        = string
  description = "Project"
  default     = "demo project"
}