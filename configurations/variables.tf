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