variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  type        = string
}

variable "location" {
  description = "Azure region for this deployment"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the UDF resource group"
  type        = string
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
}

variable "sku" {
  description = "SKU of NGINXaaS deployment."
  type        = string
}

variable "managed_identity_id" {
  description = "ID of the managed identity"
  type        = string
}

variable "managed_identity_principal_id" {
  description = "Principal ID of the managed identity"
  type        = string
}

variable "public_ip_address_id" {
  description = "ID of public IP address"
  type        = string
}

variable "subnet_id" {
  description = "ID of delegated subnet"
  type        = string
}

