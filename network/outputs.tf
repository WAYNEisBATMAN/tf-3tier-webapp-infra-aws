output "vpc_id" { value = aws_vpc.main.id }

output "availability_zones" {
  value = local.availability_zones
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "web_sg_id" { value = aws_security_group.web_sg.id }


