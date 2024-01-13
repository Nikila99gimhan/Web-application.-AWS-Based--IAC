variable "subnet_id" {}

resource "aws_instance" "web" {
  ami           = "ami-0084b033b53412473"  # Replace with your AMI ID
  instance_type = "t4g.small"
  subnet_id     = var.subnet_id
  key_name      = "myall"  # Replace with your key pair name

  tags = {
    Name = "WebServer"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}
