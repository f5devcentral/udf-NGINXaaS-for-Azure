variable "ip_address" {
  description = "IP Address of the NGINXaaS deployment"
  type = string
}

variable "desktop_path" {
  description = "Path to user's Desktop directory"
  type        = string
  default     = "~/Desktop"
}