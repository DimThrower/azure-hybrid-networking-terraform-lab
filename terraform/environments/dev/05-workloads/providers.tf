terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Copy backend.tf.example to backend.tf and fill in the values from scripts/bootstrap_tfstate.sh.
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
