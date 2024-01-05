terraform {
  required_version = "~> 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.85"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "prerequisites" {
  source   = "../../prerequisites"
  #location = var.location
  name     = var.name
  tags     = var.tags
  resource_group_name = var.resource_group_name
}

resource "azurerm_nginx_deployment" "example" {
  name                     = var.name
  resource_group_name      = module.prerequisites.data.azure_rm_resource_group.example.name
  sku                      = var.sku
  location                 = module.prerequisites.data.azure_rm_resource_group.example.location
  capacity                 = 50
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [module.prerequisites.managed_identity_id]
  }

  frontend_public {
    ip_address = [module.prerequisites.public_ip_address_id]
  }
  network_interface {
    subnet_id = module.prerequisites.subnet_id
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_nginx_deployment.example.id
  role_definition_name = "Monitoring Metrics Publisher"
  principal_id         = module.prerequisites.managed_identity_principal_id
}
