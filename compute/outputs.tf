output "ec2_id" { value = aws_instance.web.id }
output "ec2_public_ip" { value = aws_instance.web.public_ip }
output "alb_dns" { value = aws_lb.app_lb.dns_name }
