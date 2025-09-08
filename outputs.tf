output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.rg.name
}

output "vnet_id" {
  description = "The ID of the VNet"
  value       = module.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet names to IDs"
  value       = module.subnet.ids
}