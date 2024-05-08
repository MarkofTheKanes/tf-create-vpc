# --------------------
# GENERAL VARIABLES
region            = "us-east-2"
availability_zone = "us-east-2a"
script_name       = "post_install.sh"

# --------------------
# KEY PAIR VARIABLES
key_pair_name      = "instance_key_pair_name"
key_pair_file_name = "Mykey.pem"
key_pair_algo      = "RSA"
key_pair_algo_bits = "4096"

# --------------------
# INSTANCE VARIABLES
instance_type = "t2.micro"
image_name    = "ami-080e449218d4434fa"
#instance_tag  = "ec2-demo"
instance_name = "ec2-demo"
counter       = 1

#----------------
# SG VARIABLES
sg_name        = "sg_demo"
sg_description = "Demo Security group"
eg_description = "Allow all egress traffic"

#----------------
# VPC VARIABLES
cidr_blockval = "10.0.0.0/16"

#----------------
# S3 VARIABLES
bucket_name = "s3_demo"



