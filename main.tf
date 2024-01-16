module "prerequisites" {
  source = "./prerequisites"
  name                = var.name
  tags                = var.tags
  resource_group_name = var.resource_group_name
}

module "deployments" {
  source                        = "./deployments"
  name                          = var.name
  tags                          = var.tags
  sku                           = var.sku
  managed_identity_id           = module.prerequisites.managed_identity_id
  managed_identity_principal_id = module.prerequisites.managed_identity_principal_id
  public_ip_address_id          = module.prerequisites.public_ip_address_id
  subnet_id                     = module.prerequisites.subnet_id
  location                      = module.prerequisites.location
  resource_group_name           = var.resource_group_name
}

module "configurations" {
  source        = "./configurations"
  deployment_id = module.deployments.deployment_id
  configure     = var.configure
  config_files = {
    base = {
      virtual_path = "/etc/nginx/nginx.conf"
      content      = filebase64("${path.module}/files/https/nginx.conf")
    }
    api = {
      virtual_path = "/etc/nginx/site/api.conf"
      content      = filebase64("${path.module}/files/https/api.conf")
    }
  }
}

module "certificates" {
  source              = "./certificates"
  name                = var.name
  tags                = var.tags
  location            = module.prerequisites.location
  resource_group_name = var.resource_group_name
  deployment_id       = module.deployments.deployment_id
  principal_id        = module.prerequisites.managed_identity_principal_id
}

resource "local_file" "desktop_link" {

  for_each = toset(["http", "https"])

  content = templatefile("${path.module}/templates/urlfile.tpl",
    {
      proto = each.key
      instance_ip = module.deployments.ip_address
    }
  )

  filename = pathexpand("~/Desktop/${upper(each.key)}NGINXaaS Instance.desktop")

}
