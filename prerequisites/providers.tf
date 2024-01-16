terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.44"
    }
  }
}

provider "azurerm" {
  features {}
  # this is needed due to UDF restrictions
  skip_provider_registration = true
}