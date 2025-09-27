output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnets
}


output "db_instance" {
  value = module.database.db_instance
}

output "s3_bucket" {
  value = module.storage.bucket_name
}

output "sns_topic" {
  value = module.monitoring.sns_topic
}


output "ec2_public_ip" {
  value = module.compute.ec2_public_ip
}
output "alb_dns" {
  value = module.compute.alb_dns
}
output "rds_endpoint" {
  value = module.database.rds_endpoint
}
output "bucket_name" {
  value = module.storage.bucket_name
}
output "cloudwatch_alarm" {
  value = module.monitoring.alarm_name
}
