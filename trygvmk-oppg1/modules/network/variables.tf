variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "location" {
  type        = string
  description = "Deployment location"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}