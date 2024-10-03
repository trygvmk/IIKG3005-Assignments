locals {
  resource_prefix = "${var.resource_owner}-${var.environment}"

  vm_size_presets = {
    small  = "Standard_DS1_v2" # 1 vCPU, 3.5 GB RAM
    medium = "Standard_DS2_v2" # 2 vCPUs, 7 GB RAM
    large  = "Standard_DS3_v2" # 4 vCPUs, 14 GB RAM
  }

  storage_type_presets = {
    standard_lrs = "Standard_LRS" # Locally-redundant storage
    standard_grs = "Standard_GRS" # Geo-redundant storage
    premium_lrs  = "Premium_LRS"  # Premium locally-redundant storage
    premium_grs  = "Premium_GRS"  # Premium geo-redundant storage
  }

  resource_names = {
    resource_group_name  = "rg-${local.resource_prefix}"
    vnet_name            = "vnet-${local.resource_prefix}"
    subnet_name          = "subnet-${local.resource_prefix}"
    storage_account_name = "sa00${var.resource_owner}00${var.environment}"
    vm_name              = "vm-${local.resource_prefix}"
    container_name       = "container-${local.resource_prefix}"
    key_vault_name       = "kv-${local.resource_prefix}"
  }

  tags = {
    owner        = var.resource_owner
    company_name = var.company_name
    environment  = var.environment
    project      = var.project
  }
}
