#---------------------------------------------------
# Root Module
#---------------------------------------------------



#---------------------------------------------------
# Compute Module
#---------------------------------------------------

output "ec2_public_ip" {
  value = module.compute.ec2_public_ip
}

output "alb_dns" {
  value = module.compute.alb_dns
}



#---------------------------------------------------
# Database Module
#---------------------------------------------------

output "rds_endpoint" {
  value = module.database.rds_endpoint
}

output "bucket_name" {
  value = module.storage.bucket_name
}

output "rds_endpoint" { value = aws_db_instance.rds.address }

output "dynamodb_table" { value = module.storage.aws_dynamodb_table.sessions.name }


#---------------------------------------------------
# Storage Module
#---------------------------------------------------


output "s3_bucket_names" {
  value = module.storage.bucket_name
}


#---------------------------------------------------
# Monitoring Module
#---------------------------------------------------

output "cloudwatch_alarm" {
  value = module.monitoring.alarm_name
}



#---------------------------------------------------
# Network Module
#---------------------------------------------------

output "vpc_id" {
  value = module.network.aws_vpc.main.id

}

output "availability_zones" {
  value = module.network.availability_zones
}
output "public_subnet_ids" {
  value = module.network.aws_subnet.public[*].id
}

output "web_sg_id" {
  value = module.network.aws_security_group.web_sg.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.network.aws_internet_gateway.igw.id
}



