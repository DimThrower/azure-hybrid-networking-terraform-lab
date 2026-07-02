module "web_nsg" {
  source              = "../../../modules/nsg"
  name                = "nsg-${var.name_prefix}-web-${var.environment}"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  subnet_id           = data.terraform_remote_state.spokes.outputs.app_spoke_subnet_ids["snet-app"]

  security_rules = [
    {
      name                       = "Allow-HTTP-From-VNet"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-SSH-From-VNet"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
  ]

  tags = local.common_tags
}

module "web_lb" {
  source              = "../../../modules/internal_load_balancer"
  name                = "ilb-${var.name_prefix}-web-${var.environment}"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  subnet_id           = data.terraform_remote_state.spokes.outputs.app_spoke_subnet_ids["snet-app"]
  private_ip_address  = var.internal_lb_private_ip
  probe_protocol      = "Http"
  probe_request_path  = "/"
  tags                = local.common_tags
}

module "web_vm" {
  source = "../../../modules/linux_vm"
  count  = var.web_vm_count

  name                = local.web_vm_names[count.index]
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  subnet_id           = data.terraform_remote_state.spokes.outputs.app_spoke_subnet_ids["snet-app"]
  size                = var.web_vm_size
  admin_username      = var.admin_username
  ssh_public_key      = file(pathexpand(var.ssh_public_key_path))
  lb_backend_pool_id  = module.web_lb.backend_pool_id
  image_offer         = "ubuntu-24_04-lts"
  image_sku           = "server"

  custom_data = base64encode(templatefile("${path.module}/web-init.sh", {
    vm_name = local.web_vm_names[count.index]
  }))

  tags = local.common_tags
}
