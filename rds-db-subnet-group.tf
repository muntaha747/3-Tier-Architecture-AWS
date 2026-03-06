resource "aws_db_subnet_group" "subnet_grouping" {
  name       = "subnet_grouping"
  subnet_ids = [aws_subnet.private_subnet_1c.id, aws_subnet.private_subnet_2c.id]

  tags = {
    Name = "My DB subnet group"
  }
}
