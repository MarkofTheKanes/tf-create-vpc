output "post_install_script" {
  description = "Post- installation file name"
  #value       = try(aws_instance.ec2-demo.user_data)
  value = try(file(var.script_name))
}


output "ec2_instance_private_ip" {
  description = "Private Ip of the EC2 instance(s)"
  value       = try(aws_instance.ec2-demo[*].private_ip)
}

output "ec2_instance_public_ip" {
  description = "Public Ip of the EC2 instance(s)"
  value       = try(aws_instance.ec2-demo[*].public_ip)
}

/* 
output "kms_key" {
  description = "The KMS customer master key to encrypt state buckets."
  value       = aws_kms_key.state.id
}
*/