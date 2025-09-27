resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [var.subnet_ids]
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  db_name              = "appdb"
  username             = "admin"
  password             = "password123"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_dynamodb_table" "sessions" {
  name         = "user-sessions"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "sessionId"

  attribute {
    name = "sessionId"
    type = "S"
  }
}
