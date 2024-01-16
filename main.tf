resource "random_id" "unique_id" {
  keepers = {
    name = var.name
  }
  byte_length = 12
}

locals {
  name = substr("${var.name}-${random_id.unique_id.hex}", 0, 24)
}

module "prerequisites" {
  source = "./prerequisites"
  name                = local.name
  tags                = var.tags
  resource_group_name = var.resource_group_name
}

module "deployments" {
  source                        = "./deployments"
  name                          = local.name
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
  depends_on    = [ module.certificates ]
}

module "certificates" {
  source              = "./certificates"
  name                = local.name
  tags                = var.tags
  location            = module.prerequisites.location
  resource_group_name = var.resource_group_name
  deployment_id       = module.deployments.deployment_id
  principal_id        = module.prerequisites.managed_identity_principal_id
}

module "udf_shortcuts" {
  source     = "./udf_shortcuts"
  ip_address = module.deployments.ip_address
}