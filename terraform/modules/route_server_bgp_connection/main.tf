resource "azurerm_route_server_bgp_connection" "this" {
  name            = var.name
  route_server_id = var.route_server_id
  peer_asn        = var.peer_asn
  peer_ip         = var.peer_ip
}
