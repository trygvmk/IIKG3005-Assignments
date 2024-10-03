output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = module.network.subnet_id
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = module.storage.storage_account_name
}

output "storage_account_primary_access_key" {
  description = "Primary access key of the Storage Account"
  value       = module.storage.storage_account_primary_access_key
}

output "keyvault_name" {
  description = "Name of the Key Vault"
  value       = module.keyvault.keyvault_name
}

output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = module.vm.vm_public_ip
}

output "vm_id" {
  description = "ID of the Virtual Machine"
  value       = module.vm.vm_id
}
