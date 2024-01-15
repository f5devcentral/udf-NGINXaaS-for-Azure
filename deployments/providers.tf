terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">= 3.44"
        }
        random = {
            source  = "hashicorp/random"
            version = ">= 3.0"
        }
    }
}

provider "azurerm" {
    features {}
    # this is needed due to UDF restrictions
    skip_provider_registration = true
}