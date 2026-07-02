module "rg_network" {
  source   = "../../../modules/resource_group"
  name     = "rg-${var.name_prefix}-network-dev"
  location = var.location
  tags     = local.common_tags
}

module "rg_management" {
  source   = "../../../modules/resource_group"
  name     = "rg-${var.name_prefix}-management-dev"
  location = var.location
  tags     = local.common_tags
}