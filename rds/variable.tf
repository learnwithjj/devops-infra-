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

