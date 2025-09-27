output "rds_endpoint" { value = aws_db_instance.rds.address }
output "dynamodb_table" { value = aws_dynamodb_table.sessions.name }
