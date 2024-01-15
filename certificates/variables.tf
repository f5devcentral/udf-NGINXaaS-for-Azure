# variable "location" {
#  description = "Azure location name for NGINXaaS deployment."
#  default     = "eastus2"
#}

variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  default     = "example-nginx"
}

# variable "sku" {
#   description = "SKU of NGINXaaS deployment."
#   default     = "standard_Monthly"
# }

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env = "Production"
  }
}

variable "resource_group_name" {
  description = "Name of UDF resource group"
}

variable "deployment_id" {
  description = "NGINXaaS deployment ID"
}

variable "location" {
  description = "Location for key vault"
}

variable "principal_id" {
  description = "Principal ID of the managed identity"
}