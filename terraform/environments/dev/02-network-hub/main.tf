module "hub_vnet" {
  source              = "../../../modules/vnet"
  name                = "vnet-${var.name_prefix}-hub-dev"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  address_space       = ["10.10.0.0/16"]
  subnets = {
    AzureBastionSubnet = "10.10.1.0/26"
    RouteServerSubnet  = "10.10.2.0/27"
    GatewaySubnet      = "10.10.3.0/27"
    snet-management    = "10.10.10.0/24"
    snet-nva           = "10.10.20.0/24"
  }
  tags = local.common_tags
}

# Uncomment after you confirm VNet/subnet deployment. Bastion is billable.
module "bastion" {
   source              = "../../../modules/bastion"
   name                = "bas-${var.name_prefix}-hub-dev"
   resource_group_name = module.rg_network.name
   location            = var.location
   subnet_id           = module.hub_vnet.subnet_ids["AzureBastionSubnet"]
   tags                = local.common_tags
 }

 # Uncomment after hub/spoke and Bastion are validated. Route Server is billable.
module "route_server" {
   source              = "../../../modules/route_server"
   name                = "ars-${var.name_prefix}-hub-dev"
   resource_group_name = module.rg_network.name
   location            = var.location
   subnet_id           = module.hub_vnet.subnet_ids["RouteServerSubnet"]
   tags                = local.common_tags
 }