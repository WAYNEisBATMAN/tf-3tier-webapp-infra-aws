output "vpc_id" { value = aws_vpc.main.id }

output "public_subnet_ids" {
  value       = [aws_subnet.public1.id, aws_subnet.public2.id]
  description = "List of public subnet IDs across AZs"
}

output "web_sg_id" { value = aws_security_group.web_sg.id }
