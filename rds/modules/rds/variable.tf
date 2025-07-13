variable "rds_name" {
  default = "sample"
  type    = string
}

variable "environment" {
  default = "dev"
  type    = string
}

variable "vpc_id" {
  default = "dev"
  type    = string
}

variable "instance_count" {
  default = 1
  type    = number
}

