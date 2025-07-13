resource "aws_instance" "jumpbox" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"
  tags = {
    Name = "${var.ec2_name}-${var.environment}-jumpbox"
  }
}

resource "aws_subnet" "example" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"
  security_groups = [aws_security_group.bastion_sg.id] 
  tags = {
    Name = "ec2-subnet-${var.environment}"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg-${var.environment}"
  description = "Allow SSH from your IP"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


