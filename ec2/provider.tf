terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  version = "~> 6.0"
  assume_role {
   role_arn = var.role_arn
  }
}
