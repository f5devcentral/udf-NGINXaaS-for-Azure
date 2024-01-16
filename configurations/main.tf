resource "azurerm_nginx_configuration" "example" {
  count = var.configure ? 1 : 0
  nginx_deployment_id = var.deployment_id
  root_file           = "/etc/nginx/nginx.conf"

  dynamic "config_file" {
    for_each = var.config_files

    content {
      content      = config_file.value["content"]
      virtual_path = config_file.value["virtual_path"]
    }
  }
}
