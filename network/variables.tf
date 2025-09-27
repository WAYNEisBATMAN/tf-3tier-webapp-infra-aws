variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_cidr" { default = "10.0.1.0/24" }
variable "az1" { default = "ap-south-1a" } # This is aws Availability Zone and not the region.
variable "az2" { default = "ap-south-1b" } # This is aws Availability Zone and not the region.
