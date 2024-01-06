module "prerequisites" {
  source   = "./prerequisites"
  #location = var.location
  name     = var.name
  tags     = var.tags
  resource_group_name = var.resource_group_name
}

module "deployments" {
  source  = "./deployments/create-or-update"
  name    = var.name
  tags    = var.tags
  sku      = var.sku
  managed_identity_id = module.prerequisites.managed_identity_id
  managed_identity_principal_id = module.prerequisites.managed_identity_principal_id
  public_ip_address_id  = module.prerequisites.public_ip_address_id
  subnet_id = module.prerequisites.subnet_id
  location = module.prerequisites.location
  resource_group_name = var.resource_group_name
}

module "cofigurations" {
  source = "./configurations"
  deployment_id = module.deployments.deployment_id
  configure = var.configure
}