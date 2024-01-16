variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  default     = "example-nginx"
}

variable "sku" {
  description = "SKU of NGINXaaS deployment."
  default     = "standard_Monthly"
}

variable "resource_group_name" {
  description = "Name of resource group"
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env = "Production"
  }
}

variable "managed_identity_id" {
  description = "ID of the managed identity"
}

variable "managed_identity_principal_id" {
  description = "Principal ID of the managed identity"
}

variable "public_ip_address_id" {
  description = "ID of public IP address"
}

variable "subnet_id" {
  description = "ID of delegated subnet"
}

variable "location" {
  description = "Location from UDF Resource Group"
}