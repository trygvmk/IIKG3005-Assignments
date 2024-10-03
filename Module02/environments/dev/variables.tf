variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "trygvmk-demo-rg"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group"
  default     = "trygvmk-demo-nsg"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
  default     = "trygvmk-demo-vnet"
}

variable "subnet1_name" {
  type        = string
  description = "Name of the first subnet"
  default     = "subnet1"
}

variable "subnet2_name" {
  type        = string
  description = "Name of the second subnet"
  default     = "subnet2"
}