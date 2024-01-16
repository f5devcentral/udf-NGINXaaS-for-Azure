data "azurerm_client_config" "current" {}

# resource "random_id" "key_vault_id" {
#   keepers = {
#     name = var.name
#   }
#   byte_length = 8
# }

# locals {
#   vault_name = substr("${var.name}-${random_id.key_vault_id.hex}", 0, 24)
# }

# This keyvault is NOT firewalled.
resource "azurerm_key_vault" "example" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  enable_rbac_authorization = true

  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  tags = var.tags
}

# This will give the current user admin permissions on the key vault
resource "azurerm_role_assignment" "current_user" {
  scope                = azurerm_key_vault.example.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_certificate" "example" {
  name         = var.name
  key_vault_id = azurerm_key_vault.example.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = false
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pem-file"
    }

    x509_certificate_properties {
      extended_key_usage = [
        "1.3.6.1.5.5.7.3.1",
        "1.3.6.1.5.5.7.3.2"
      ]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject            = "CN=example.com"
      validity_in_months = 12
    }
  }
  depends_on = [azurerm_role_assignment.current_user]
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_key_vault.example.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.principal_id
}

resource "azurerm_nginx_certificate" "example" {
  name                     = var.name
  nginx_deployment_id      = var.deployment_id
  key_virtual_path         = "/etc/nginx/ssl/test.key"
  certificate_virtual_path = "/etc/nginx/ssl/test.crt"
  key_vault_secret_id      = azurerm_key_vault_certificate.example.secret_id
}

