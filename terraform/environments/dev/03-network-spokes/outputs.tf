output "app_spoke_vnet_id" {
  value = module.app_spoke_vnet.id
}

output "app_spoke_vnet_name" {
  value = module.app_spoke_vnet.name
}

output "app_spoke_subnet_ids" {
  value = module.app_spoke_vnet.subnet_ids
}

output "data_spoke_vnet_id" {
  value = module.data_spoke_vnet.id
}

output "data_spoke_vnet_name" {
  value = module.data_spoke_vnet.name
}

output "data_spoke_subnet_ids" {
  value = module.data_spoke_vnet.subnet_ids
}