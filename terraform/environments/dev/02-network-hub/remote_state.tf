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