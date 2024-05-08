# --------------------
# GENERAL VARIABLES
variable "availability_zone" {
  description = "Availability Zones for the Subnet"
  type        = string
  default     = "us-east-2a"
  validation {
    condition     = length(var.availability_zone) >= 8
    error_message = "The availability zone name must be 8 characters or more in length."
  }
}

variable "region" {
  description = "Region for the Subnet"
  type        = string
  default     = "us-east-2"
  validation {
    condition     = length(var.region) >= 8
    error_message = "The region name must be be 8 characters or more in length."
  }
}

variable "script_name" {
  description = "Name of script with cmds to be remotely executed"
  type        = string
  default     = "post-install.sh"
  validation {
    condition     = length(var.script_name) >= 8
    error_message = "The installation script name must be 8 characters or more in length."
  }
}

# --------------------
# KEY PAIR VARIABLES
variable "key_pair_name" {
  description = "Key pair name"
  type        = string
  default     = "instance_key_pair_name"
  validation {
    condition     = length(var.key_pair_name) >= 4
    error_message = "The Key pair name must be 4 characters or more in length."
  }
}

variable "key_pair_file_name" {
  description = "Key pair file name"
  type        = string
  default     = "Mykey.pem"
  validation {
    condition     = length(var.key_pair_file_name) >= 8
    error_message = "The Key pair name must be 8 characters or more in length including the .pem extension."
  }
}

variable "key_pair_algo" {
  description = "Key pair Algorithm"
  type        = string
  default     = "RSA"
  validation {
    condition     = length(var.key_pair_algo) >= 2
    error_message = "The Key Pair Algorithm name must be 3 characters or more in length."
  }
}

variable "key_pair_algo_bits" {
  description = "Key pair Algorithm bits"
  type        = number
  default     = "4096"
  validation {
    condition     = var.key_pair_algo_bits >= 256
    error_message = "The Key Pair Algorithm bits value must be 256 or more."
  }
}

# --------------------
# INSTANCE VARIABLES
variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = length(var.instance_type) >= 4
    error_message = "The Instance Type name must be 4 characters or more in length."
  }
}

variable "image_name" {
  description = "Name of instance image to use"
  type        = string
  default     = "ami-080e449218d4434fa"
  validation {
    condition     = length(var.image_name) >= 8
    error_message = "The Instance Image name must be 8 characters or more in length."
  }
}

/*
variable "instance_tag" {
  description = "Tag(s) for each Instance(s)"
  type        = list(string)
  default = "ec2-demo"
  validation {
    condition     = length(var.instance_tag) > 3
    error_message = "The Instance Image tag must be 4 characters or more in length."
  }
}
*/

variable "instance_name" {
  description = "The name to give the instance."
  type        = string
  default     = "ec2-demo"
  validation {
    condition     = length(var.instance_name) >= 6
    error_message = "The Instance name must be 6 characters or more in length."
  }
}

/* variable "ports" {
  type    = list(any)
  default = [8201, 8202, 8300, 9201]
  default = ""
}
*/

variable "counter" {
  description = "Number of instances to launch"
  type        = number
  default     = "1"
  validation {
    condition     = var.counter >= 0
    error_message = "The number of instances to launch must be >= 0."
  }
}

#----------------
# SG VARIABLES
variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default     = "sg-demo"
  validation {
    condition     = length(var.sg_name) >= 4
    error_message = "The Security Group Name must be 4 characters or more in length."
  }
}

variable "sg_description" {
  description = "Security Group"
  type        = string
  default     = "Demo Security group"
  validation {
    condition     = length(var.sg_description) >= 4
    error_message = "The Security Group Description must be 4 characters or more in length."
  }
}

variable "eg_description" {
  description = "Egress"
  type        = string
  default     = "All Egress permitted"
  validation {
    condition     = length(var.eg_description) >= 4
    error_message = "The Egress Description must be 4 characters or more in length."
  }
}

#----------------
# VPC VARIABLES
variable "cidr_blockval" {
  description = "VPC CIDR Block"
  type        = string
  default     = "0.0.0.0/0"
  validation {
    condition     = can(cidrhost(var.cidr_blockval, 32))
    error_message = "Must be valid IPv4 CIDR."
  }

}

#----------------
# S3 VARIABLES
variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "demoS3_bucket"
  validation {
    condition     = length(var.bucket_name) >= 4
    error_message = "The S3 Bucket Name must be 4 characters or more in length."
  }
}
