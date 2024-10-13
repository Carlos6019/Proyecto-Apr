#Configurar version de terraform
#Descargara el proveedor de aws
terraform {
  required_version = ">= 1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "bucketeks3"
    key    = "terraform"
    region = "us-east-1"
  }
}
