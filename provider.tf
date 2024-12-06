terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  # Configuration option
  region = var.default_region
  assume_role {
    role_arn = var.role_arn
  }
}
