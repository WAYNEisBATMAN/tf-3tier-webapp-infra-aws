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
