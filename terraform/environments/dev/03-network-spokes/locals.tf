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
}
