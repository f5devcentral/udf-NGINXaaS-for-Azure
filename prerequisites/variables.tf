variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  default     = "example-nginx"
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
