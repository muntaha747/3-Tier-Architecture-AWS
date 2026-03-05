########################################################################################
#NAT Gateway private subnets 1b and 2b only
########################################################################################
resource "aws_eip" "nat_gateway" {
  domain = "vpc"
  tags   = { Name = "nat_gateway_eip" }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet_1a.id
  tags          = { Name = "nat_gateway" }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet_2a.id
  tags          = { Name = "nat_gateway" }
}

