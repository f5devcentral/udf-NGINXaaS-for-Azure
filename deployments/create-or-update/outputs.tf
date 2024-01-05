output "ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = azurerm_nginx_deployment.example.ip_address
}

output "deployment_id" {
  description = "ID of NGINXaaS deployment"
  value       = azurerm_nginx_deployment.example.id
}
