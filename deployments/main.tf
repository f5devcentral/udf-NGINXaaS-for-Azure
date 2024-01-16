resource "azurerm_nginx_deployment" "example" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  sku                      = var.sku
  location                 = var.location
  capacity                 = 50
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [var.managed_identity_id]
  }

  frontend_public {
    ip_address = [var.public_ip_address_id]
  }
  network_interface {
    subnet_id = var.subnet_id
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_nginx_deployment.example.id
  role_definition_name = "Monitoring Metrics Publisher"
  principal_id         = var.managed_identity_principal_id
}
