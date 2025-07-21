resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = lower("${var.rds_name}-${var.environment}")
  engine                  = "aurora-postgresql"
  availability_zones      = ["us-east-1b"]
  master_username         = var.rds_username
  master_password         = var.rds_password
  backup_retention_period = 1
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = var.instance_count
  identifier         = lower("${var.rds_name}-${var.environment}-${count.index}")
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = "db.t3.micro"
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version
}

resource "aws_db_subnet_group" "default" {
  name       = lower("${var.rds_name}-${var.environment}-subnet-group")
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  tags = {
    Name = lower("${var.rds_name}-${var.environment}-subnet-group")
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.0.0/24"
  tags = {
    Name = "subnet-rds-${var.environment}-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.0.0/24"
  tags = {
    Name = "subnet-rds-${var.environment}-2"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg-${var.environment}"
  description = "Allow inbound RDS traffic"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
