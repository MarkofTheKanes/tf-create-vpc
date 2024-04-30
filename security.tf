locals {
  inbound_rules = [
    { port = 22, protocol = "tcp", description = "SSH access" },
    { port = 80, protocol = "tcp", description = "HTTP access" },
    { port = 443, protocol = "tcp", description = "HTTPS access" },
  ]
}

# Security Groups
resource "aws_security_group" "sg_demo" {
  vpc_id      = aws_vpc.test_env.id
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = local.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = var.eg_description
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  #tags = {
  #  Name = "sg-webserver",
  #}
}


/*
resource "aws_security_group" "allow_all" {
  name = "allow_ssh_and_http"

  tags = {
    Name = "allow_ssh_and_http"
  }

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  ingress {
    description = "https Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_block
    self        = false

  }
}

*/