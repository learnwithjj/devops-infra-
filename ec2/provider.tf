provider "aws" {
  version = "~> 6.0"
  assume_role {
   role_arn = var.role_arn
  }
}
