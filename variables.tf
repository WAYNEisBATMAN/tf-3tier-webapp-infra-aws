variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# Compute Module
variable "ami_id" {}

# Network Module
variable "az1" {} # This is aws Availability Zone and not the region.
variable "az2" {} # This is aws Availability Zone and not the region.


variable "public_subnet_cidr1" { default = "10.0.1.0/24" }
variable "public_subnet_cidr2" { default = "10.0.2.0/24" }