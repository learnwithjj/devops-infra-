variable "ec2_name" {
  default = "sample"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "role_arn"{
 type = string
  default = ""
}
