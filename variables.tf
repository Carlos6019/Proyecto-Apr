variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "terraform-eks"
}

variable "access_key" {
  type        = string
  description = "aws access_key"
  default     = ""
}

variable "secret_key" {
  type        = string
  description = "aws secret_key"
  default     = ""
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "config_path" {
  type        = string
  description = "Path to the kubernetes config file"
  default     = "~/.kube/config"
}