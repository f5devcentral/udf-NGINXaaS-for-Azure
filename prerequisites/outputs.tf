output "managed_identity_id" {
  description = "ID of the managed identity."
  value       = azurerm_user_assigned_identity.example.id
}

output "managed_identity_principal_id" {
  description = "Principal ID of the managed identity."
  value       = azurerm_user_assigned_identity.example.principal_id
}

output "public_ip_address_id" {
  description = "ID of public IP address."
  value       = azurerm_public_ip.example.id
}

output "subnet_id" {
  description = "ID of delegated subnet."
  value       = azurerm_subnet.example.id
}

output "location" {
  description = "Location of the resource group"
  value       = data.azurerm_resource_group.example.location
}
