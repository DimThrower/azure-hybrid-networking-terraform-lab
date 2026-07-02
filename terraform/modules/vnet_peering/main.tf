resource "azurerm_virtual_network_peering" "a_to_b" {
  name                         = var.peering_name_a_to_b
  resource_group_name          = var.resource_group_name_a
  virtual_network_name         = var.virtual_network_name_a
  remote_virtual_network_id    = var.virtual_network_id_b
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = var.allow_gateway_transit_a_to_b
}

resource "azurerm_virtual_network_peering" "b_to_a" {
  name                         = var.peering_name_b_to_a
  resource_group_name          = var.resource_group_name_b
  virtual_network_name         = var.virtual_network_name_b
  remote_virtual_network_id    = var.virtual_network_id_a
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = var.use_remote_gateways_b_to_a
}
