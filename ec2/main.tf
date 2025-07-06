resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"
  tags = {
    Name = "${var.ec2_name}-${var.environment}"
  }
}

