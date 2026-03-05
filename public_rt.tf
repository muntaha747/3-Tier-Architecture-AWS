########################################################################################
#Public route table
########################################################################################
resource "aws_route_table" "dev_public_route_table" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = var.public_route_table
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = "Public_route_table"
  }
}


########################################################################################
#Public Route Table Association
########################################################################################
resource "aws_route_table_association" "public_rt_association_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.dev_public_route_table.id
}

resource "aws_route_table_association" "public_rt_association_subnet_2a" {
  subnet_id      = aws_subnet.public_subnet_2a.id
  route_table_id = aws_route_table.dev_public_route_table.id
}



