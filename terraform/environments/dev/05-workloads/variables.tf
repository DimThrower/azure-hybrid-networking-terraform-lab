variable "location" {
  type        = string
  description = "Azure region for lab resources."
  default     = "centralus"
}

variable "name_prefix" {
  type        = string
  description = "Short resource naming prefix."
  default     = "eahl"
}

variable "environment" {
  type        = string
  description = "Environment name for this deployment."
  default     = "dev"
}

variable "owner_email" {
  type        = string
  description = "Owner tag value."
  default     = "cloudops@example.com"
}