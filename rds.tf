resource "aws_db_instance" "database_instance" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "pragradb"
  password             = "pragra123"
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.subnet_grouping.name
  skip_final_snapshot  = true
  deletion_protection  = false
}


