provider "azurerm" {
  subscription_id = "${TF_VAR_SUBSCREPTION_ID}"
  client_id       = "${TF_VAR_CLIENT_ID}"
  client_secret   = "${TF_VAR_CLIENT_SECRET}"
  tenant_id       = "${TF_VAR_TENANT_ID}"
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