variable "name" {
  description = "Name of NGINXaaS deployment and related resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "tags" {
  description = "Tags for NGINXaaS deployment and related resources."
  type        = map(any)
}
