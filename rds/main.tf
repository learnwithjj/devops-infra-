data "aws_vpc" "default" {
  id = var.vpc_id
}

module "rds" {
  source             = "./modules/rds"
  rds_name           = var.rds_name
  vpc_id             = data.aws_vpc.default.id
  environment        = var.environment
  instance_count     = var.instance_count
  rds_username       = var.rds_username
  rds_password       = var.rds_password
  jumpbox_cidr_block = var.jumpbox_cidr_block
}


module "ec2" {
  source             = "./modules/ec2"
  ec2_name           = var.ec2_name
  environment        = var.environment
  vpc_id             = data.aws_vpc.default.id
  jumpbox_cidr_block = var.jumpbox_cidr_block
}


