variable "ip_address" {
  description = "IP Address of the NGINX deployment"
}

variable "desktop_path" {
  description = "Path to user's Desktop directory"
  type        = string
  default     = "~/Desktop"
}