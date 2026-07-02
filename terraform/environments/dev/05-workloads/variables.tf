variable "location" {
  type        = string
  description = "Azure region."
  default     = "centralus"
}

variable "name_prefix" {
  type        = string
  description = "Short naming prefix."
  default     = "eahl"
}

variable "environment" {
  type        = string
  description = "Environment name."
  default     = "dev"
}

variable "owner_email" {
  type        = string
  description = "Owner tag value."
  default     = "cloudops@example.com"
}

variable "admin_username" {
  type        = string
  description = "Admin username for Linux VMs."
  default     = "azureadmin"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to local SSH public key."
  default     = "~/.ssh/id_rsa.pub"
}

variable "web_vm_size" {
  type        = string
  description = "Small VM size for lab web servers."
  default     = "Standard_B1ls"
}

variable "web_vm_count" {
  type        = number
  description = "Number of web VMs."
  default     = 2
}

variable "internal_lb_private_ip" {
  type        = string
  description = "Static private IP for the internal load balancer."
  default     = "10.20.20.10"
}