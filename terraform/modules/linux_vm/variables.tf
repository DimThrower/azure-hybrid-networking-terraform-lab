variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "subnet_id" { type = string }
variable "admin_username" { type = string }
variable "ssh_public_key" { type = string }
variable "size" { type = string, default = "Standard_B1s" }
variable "custom_data" { type = string, default = null }
variable "tags" { type = map(string) }
