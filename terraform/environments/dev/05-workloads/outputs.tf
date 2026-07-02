output "web_nsg_id" {
  value = module.web_nsg.id
}

output "web_lb_id" {
  value = module.web_lb.id
}

output "web_lb_backend_pool_id" {
  value = module.web_lb.backend_pool_id
}

output "web_vm_ids" {
  value = [for vm in module.web_vm : vm.id]
}

output "web_vm_private_ips" {
  value = [for vm in module.web_vm : vm.private_ip_address]
}
