output "alarm_name" { value = aws_cloudwatch_metric_alarm.high_cpu.alarm_name }
output "log_group_name" { value = aws_cloudwatch_log_group.app_logs.name }
