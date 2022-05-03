provider "azurerm" {
  subscription_id = "${subscription_id}"
  client_id       = "${client_id}"
  client_secret   = "${client_secret}"
  tenant_id       = "${tenant_id}"
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}