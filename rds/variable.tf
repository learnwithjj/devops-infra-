variable "ec2_name" {
  default = "sample"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "rds_name" {
  default = "sample"
  type    = string
}

variable "instance_count" {
  default = 1
  type    = number
}

variable "rds_username" {
  default = ""
  type    = string
}

variable "rds_password" {
  default = ""
  type    = string
}

variable "vpc_id" {
  default = ""
  type    = string
}

variable "jumpbox_cidr_block" {
  default = ["25.0.0.0/16"]
  type    = list(string)
}
