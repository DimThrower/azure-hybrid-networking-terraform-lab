
module "app_spoke_vnet" {
  source              = "../../../modules/vnet"
  name                = "vnet-${var.name_prefix}-app-dev"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  address_space       = ["10.20.0.0/16"]
  subnets = {
    snet-web = "10.20.10.0/24"
    snet-app = "10.20.20.0/24"
  }
  tags = local.common_tags
}

module "data_spoke_vnet" {
  source              = "../../../modules/vnet"
  name                = "vnet-${var.name_prefix}-data-dev"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  address_space       = ["10.30.0.0/16"]
  subnets = {
    snet-data = "10.30.10.0/24"
  }
  tags = local.common_tags
}

module "hub_to_app_peering" {
  source                       = "../../../modules/vnet_peering"
  peering_name_a_to_b          = "peer-hub-to-app"
  peering_name_b_to_a          = "peer-app-to-hub"
  resource_group_name_a        = data.terraform_remote_state.platform.outputs.resource_group_network
  resource_group_name_b        = data.terraform_remote_state.platform.outputs.resource_group_network
  virtual_network_name_a       = data.terraform_remote_state.network_hub.outputs.hub_vnet_name
  virtual_network_name_b       = module.app_spoke_vnet.name
  virtual_network_id_a         = data.terraform_remote_state.network_hub.outputs.hub_vnet_id
  virtual_network_id_b         = module.app_spoke_vnet.id
  allow_gateway_transit_a_to_b = false
  use_remote_gateways_b_to_a   = false
}

module "hub_to_data_peering" {
  source                       = "../../../modules/vnet_peering"
  peering_name_a_to_b          = "peer-hub-to-data"
  peering_name_b_to_a          = "peer-data-to-hub"
  resource_group_name_a        = data.terraform_remote_state.platform.outputs.resource_group_network
  resource_group_name_b        = data.terraform_remote_state.platform.outputs.resource_group_network
  virtual_network_name_a       = data.terraform_remote_state.network_hub.outputs.hub_vnet_name
  virtual_network_name_b       = module.data_spoke_vnet.name
  virtual_network_id_a         = data.terraform_remote_state.network_hub.outputs.hub_vnet_id
  virtual_network_id_b         = module.data_spoke_vnet.id
  allow_gateway_transit_a_to_b = false
  use_remote_gateways_b_to_a   = false
}

