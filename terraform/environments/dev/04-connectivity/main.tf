module "onprem_vnet" {
  source              = "../../../modules/vnet"
  name                = "vnet-${var.name_prefix}-onprem-sim"
  resource_group_name = data.terraform_remote_state.platform.outputs.resource_group_network
  location            = var.location
  address_space       = ["10.50.0.0/16"]
  subnets = {
    snet-onprem-servers = "10.50.10.0/24"
  }
  tags = merge(local.common_tags, { Application = "SimulatedOnPrem" })
}

module "hub_to_onprem_peering" {
  source                       = "../../../modules/vnet_peering"
  peering_name_a_to_b          = "peer-hub-to-onprem-sim"
  peering_name_b_to_a          = "peer-onprem-sim-to-hub"
  resource_group_name_a        = data.terraform_remote_state.platform.outputs.resource_group_network
  resource_group_name_b        = data.terraform_remote_state.platform.outputs.resource_group_network
  virtual_network_name_a       = data.terraform_remote_state.network_hub.outputs.hub_vnet_name
  virtual_network_name_b       = module.onprem_vnet.name
  virtual_network_id_a         = data.terraform_remote_state.network_hub.outputs.hub_vnet_id
  virtual_network_id_b         = module.onprem_vnet.id
  allow_gateway_transit_a_to_b = false
  use_remote_gateways_b_to_a   = false
}