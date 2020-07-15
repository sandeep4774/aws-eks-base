variable "oidc_provider_arn" {
  description = "The ARN of the OIDC Provider"
  default     = ""
}

variable "name" {
  description = "Project name, required to form unique resource names"
  default     = ""
}

variable "bucket_name" {
  default     = ""
  description = "Name of the bucket to store logs"
}

variable path {
  type    = string
  default = ""
}

variable "region" {
  description = "Target region for all infrastructure resources"
  default     = ""
}

variable "create_user" {
  type    = bool
  default = false
}

variable create_role {
  type    = bool
  default = true
}