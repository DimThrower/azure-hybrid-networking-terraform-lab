data "terraform_remote_state" "platform" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-lab"
    storage_account_name = "sttfstateeahl12345"
    container_name       = "tfstate"
    key                  = "dev/01-platform.tfstate"
    use_azuread_auth     = true
  }
}

data "terraform_remote_state" "network_hub" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate-lab"
    storage_account_name = "sttfstateeahl12345"
    container_name       = "tfstate"
    key                  = "dev/02-network-hub.tfstate"
    use_azuread_auth     = true
  }
}