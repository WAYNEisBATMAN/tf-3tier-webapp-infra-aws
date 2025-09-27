# output "ec2_id" { value = aws_instance.web.id }
# output "ec2_public_ip" { value = aws_instance.web.public_ip }
output "alb_dns" { value = aws_lb.app_lb.dns_name }


# output "instance_distribution" {
#   value = {
#     for i in range(var.instance_count) :
#     "web-server-${i + 1}" => {
#       instance_id       = aws_instance.web[i].id
#       subnet_id         = aws_instance.web[i].subnet_id
#       subnet_index      = i % length(var.subnet_ids)
#       availability_zone = aws_instance.web[i].availability_zone
#     }
#   }
# }


output "instance_count" {
  description = "Total number of instances created"
  value       = length(aws_instance.web)
}

# Summary output for easy reference
output "instances_summary" {
  description = "Summary of all created instances"
  value = [
    for i in range(length(aws_instance.web)) : {
      name              = "web-server-${i + 1}"
      instance_id       = aws_instance.web[i].id
      public_ip         = aws_instance.web[i].public_ip
      private_ip        = aws_instance.web[i].private_ip
      availability_zone = aws_instance.web[i].availability_zone
      subnet_id         = aws_instance.web[i].subnet_id
    }
  ]
}
