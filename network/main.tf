resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "3tier-vpc" }
}


# In this data block, AWS returns below data:
# {
# "names": ["ap-south-1a", "ap-south-1b", "ap-south-1c"],
# "zone_ids": ["aps1-az1", "aps1-az2", "aps1-az3"],
# "state": "available"
# }

data "aws_availability_zones" "available" {
  state = "available"
}


# Here we are using count.index to get the index of the AZs.
# Slice function is used to get a subset of a list. 
# It takes three arguments: the list, the start index, and the end index (exclusive).
# End index is exclusive, so we need to give the start index as 0 and end index as var.availability_zones_count to get the 1st 'n' AZs.

locals {
  availability_zones = slice(data.aws_availability_zones.available.names, 0, var.availability_zones_count)
}

resource "aws_subnet" "public" {
  count = var.availability_zones_count

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
    Type = "public"
  }
}

# resource "aws_subnet" "public1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnet_cidr1
#   availability_zone       = var.az1
#   map_public_ip_on_launch = true
#   tags                    = { Name = "public-subnet1" }
# }

# resource "aws_subnet" "public2" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.public_subnet_cidr2
#   availability_zone       = var.az2
#   map_public_ip_on_launch = true
#   tags                    = { Name = "public-subnet2" }
# }

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "3tier-igw" }
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id
  name   = "web-sg"

  ingress {
    from_port   = 8008
    to_port     = 8008
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
