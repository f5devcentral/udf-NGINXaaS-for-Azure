# variable "location" {
#   description = "Azure location name for NGINXaaS deployment."
#   default     = "eastus2"
# }

# variable "name" {
#   description = "Name of NGINXaaS deployment and related resources."
#   default     = "example-nginx"
# }

# variable "sku" {
#   description = "SKU of NGINXaaS deployment."
#   default     = "standard_Monthly"
# }

# variable "tags" {
#   description = "Tags for NGINXaaS deployment and related resources."
#   type        = map(any)
#   default = {
#     env = "Production"
#   }
# }

# variable "resource_group_name" {
#   description = "Name of resource group"
# }

variable "deployment_id" {
  description = "Deployment ID of NGINXaaS instance"
}

variable "configure" {
  description = "Workaround for Bug ID-891. Set false to skip configuration."
  default = true
}

variable "config_files" {
  description = "Config files and paths to include in the NGINXaaS configuration"
}