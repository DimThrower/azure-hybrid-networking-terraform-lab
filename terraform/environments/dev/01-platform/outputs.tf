output "resource_group_network" {
  value = module.rg_network.name
}

output "resource_group_management" {
  value = module.rg_management.name
}

output "location" {
  value = var.location
}