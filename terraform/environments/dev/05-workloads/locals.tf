locals {
  common_tags = {
    CostCenter   = "IT-4001"
    BusinessUnit = "IT"
    Application  = "EnterpriseHybridLab"
    Environment  = "Dev"
    Owner        = var.owner_email
    Criticality  = "Tier2"
    DataClass    = "Internal"
    ManagedBy    = "Terraform"
  }

  web_vm_names = [
    for i in range(var.web_vm_count) :
    "vm-${var.name_prefix}-web-${format("%02d", i + 1)}-${var.environment}"
  ]
}