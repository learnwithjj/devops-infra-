variable "ec2_name" {
  default = "sample"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "vpc_id" {
  default = ""
  type    = string
}

variable "jumpbox_cidr_block" {
  type    = list(string)
}
