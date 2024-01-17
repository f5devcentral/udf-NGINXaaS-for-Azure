variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  type        = string
}

variable "location" {
  description = "Location for key vault"
}

variable "resource_group_name" {
  description = "Name of UDF resource group"
  type        = string
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
}

variable "deployment_id" {
  description = "NGINXaaS deployment ID"
  type        = string
}

variable "principal_id" {
  description = "Principal ID of the managed identity"
  type        = string
}