terraform {
  backend "s3" {}
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::178734969934:role/devops-infra-role"
  }
}
