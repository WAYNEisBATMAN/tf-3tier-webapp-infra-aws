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
