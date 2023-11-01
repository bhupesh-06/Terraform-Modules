data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh

// Store the private key in a local file
  provisioner "local-exec" {
  command = "echo '${tls_private_key.example.private_key_pem}' > demo.pem && chmod 400 demo.pem"
}
}

resource "aws_instance" "demo_instance" {
    count = var.counting
    ami  = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = aws_key_pair.generated_key.key_name
    disable_api_termination = var.instance_termination
    monitoring = var.instance_monitoring
    vpc_security_group_ids = [aws_security_group.main.id]

    tags = {
    Name = "${var.tags}-ec2"
  }
}

resource "aws_security_group" "main" {
  description = "Default security group to allow inbound/outbound from the VPC"
  name = var.sg_name
  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = "tcp"
      cidr_blocks = split(",", var.portip)
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.tags}-sg"
  }
}

locals {
    ingress_rules = [{
        port = var.port
        description = var.description
    }]
}
