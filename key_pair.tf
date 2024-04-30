# Create SSH Keys for EC2 Remote Access

resource "tls_private_key" "public_key" {
  algorithm = var.key_pair_algo
  rsa_bits  = var.key_pair_algo_bits
}

resource "aws_key_pair" "web_tier_EC2_rsa_key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.public_key.public_key_openssh

  /*
  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.public_key.private_key_pem}' > ./${key_pair_file_name}.pem}"
  }
  */
}

resource "local_file" "tf_key" {
  content  = tls_private_key.public_key.private_key_pem
  filename = var.key_pair_file_name

}