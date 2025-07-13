data "aws_vpc" "default" {
  id = var.vpc_id
}

module "rds" {
  source         = "./modules/rds"
  rds_name       = var.rds_name
  vpc_id         = data.aws_vpc.default.id
  environment    = var.environment
  instance_count = var.instance_count
}


module "ec2" {
  source      = "./modules/ec2"
  ec2_name    = var.ec2_name
  environment = var.environment
  vpc_id      = data.aws_vpc.default.id
}


