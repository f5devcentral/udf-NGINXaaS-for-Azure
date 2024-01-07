output "nginx_default_config_id" {
  description = "ID of default config of the NGINXaaS instance"
  value = "${module.deployments.deployment_id}/configurations/default"
}

output "ip_address" {
  description = "IP Address of NGINXaaS instance"
  value = module.deployments.ip_address
}
