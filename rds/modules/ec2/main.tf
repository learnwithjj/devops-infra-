resource "aws_instance" "jumpbox" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"
  subnet_id     = aws_subnet.example.id
  tags = {
    Name = "${var.ec2_name}-${var.environment}-jumpbox"
  }
}

resource "aws_subnet" "ec2" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.31.0.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "ec2-subnet-${var.environment}"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg-${var.environment}"
  description = "Allow SSH from your IP"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


