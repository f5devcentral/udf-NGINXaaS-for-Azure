output "deployment_id" {
  description = "ID of NGINXaaS deployment"
  value       = azurerm_nginx_deployment.example.id
}

output "ip_address" {
  description = "IP Address of NGINXaaS deployment"
  value       = azurerm_nginx_deployment.example.ip_address
}

output "nginx_resource" {
  description = "The whole resource"
  value	      = azurerm_nginx_deployment.example
}
