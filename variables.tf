variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  default     = "example-nginx"
}

variable "sku" {
  description = "SKU of NGINXaaS deployment."
  default     = "standard_Monthly"
}

variable "resource_group_name" {
  description = "Name of UDF resource group"
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
  default = {
    env = "Production"
  }
}
variable "configure" {
  description = "Workaround for Bug ID-891. Set false to skip configuration."
  default     = true
}
