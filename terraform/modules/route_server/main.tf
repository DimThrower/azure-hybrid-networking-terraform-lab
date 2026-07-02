resource "azurerm_public_ip" "route_server" {
  name                = "pip-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_route_server" "this" {
  name                             = var.name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  sku                              = "Standard"
  public_ip_address_id             = azurerm_public_ip.route_server.id
  subnet_id                        = var.subnet_id
  branch_to_branch_traffic_enabled = true
  tags                             = var.tags
}
