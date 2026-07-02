variable "peering_name_a_to_b" {
  type        = string
  description = "Name of the peering from VNet A to VNet B."
}

variable "peering_name_b_to_a" {
  type        = string
  description = "Name of the peering from VNet B to VNet A."
}

variable "resource_group_name_a" {
  type        = string
  description = "Resource group name for VNet A."
}

variable "resource_group_name_b" {
  type        = string
  description = "Resource group name for VNet B."
}

variable "virtual_network_name_a" {
  type        = string
  description = "Name of VNet A."
}

variable "virtual_network_name_b" {
  type        = string
  description = "Name of VNet B."
}

variable "virtual_network_id_a" {
  type        = string
  description = "Resource ID of VNet A."
}

variable "virtual_network_id_b" {
  type        = string
  description = "Resource ID of VNet B."
}

variable "allow_gateway_transit_a_to_b" {
  type        = bool
  description = "Whether VNet A peering allows gateway transit."
  default     = false
}

variable "use_remote_gateways_b_to_a" {
  type        = bool
  description = "Whether VNet B peering uses remote gateways."
  default     = false
}