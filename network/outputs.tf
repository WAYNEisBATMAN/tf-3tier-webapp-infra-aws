output "vpc_id" { value = aws_vpc.main.id }

output "availability_zones" {
  value = local.availability_zones
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "web_sg_id" { value = aws_security_group.web_sg.id }

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}





# Apply complete! Resources: 16 added, 0 changed, 0 destroyed.

# Outputs:

# alb_dns = "app-lb-1148673256.ap-south-1.elb.amazonaws.com"
# availability_zones = tolist([
#   "ap-south-1a",
#   "ap-south-1b",
# ])
# bucket_name = "my-terraform-app-bucket-12345"
# cloudwatch_alarm = "HighCPU"
# dynamodb_table = "user-sessions"
# ec2_public_ip = "65.0.80.14"
# internet_gateway_id = "igw-0e50b8e84141603d4"
# public_subnet_ids = [
#   "subnet-027d3860f38d073e7",
#   "subnet-0f47184235201123f",
# ]
# rds_endpoint = "terraform-20250927203148182500000002.c9sm4suyubp1.ap-south-1.rds.amazonaws.com"
# s3_bucket_names = "my-terraform-app-bucket-12345"
# vpc_id = "vpc-0924314760e9cd45c"
# web_sg_id = "sg-09968c0bdd5db28ca"
