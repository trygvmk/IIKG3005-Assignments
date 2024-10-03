locals {
  resource_group_names        = [for name in var.resource_group_names : "${var.resource_owner}-rg-${name}"]
  virtual_network_name        = "${var.resource_owner}-vnet"
  network_security_group_name = "${var.resource_owner}-nsg"
  storage_accounts_name       = "${var.resource_owner}sa"
  tags = {
    owner              = var.resource_owner
    company_name       = var.company_name
    environment        = var.environment
    billing_department = var.billing_department
    project            = var.project
  }
}