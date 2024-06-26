#Pulls AMI for ec2

data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "demo_image_name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners       = ["099720109477"] # Canonical
  description  = "Demo AMI Image"
  architecture = "x86_64"

}


data "template_file" "user_data" {
  template = file(var.script_name)
}

resource "aws_instance" "ec2-demo" {
  #ami                         = var.image_name
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg_demo.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = data.template_file.user_data.rendered
  #count                       = var.counter

  #tags = {
  #  Name = var.instance_tag[count.index]
}
