########################################################################################
#Create Internet Gateway
########################################################################################
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "DevOps_Internet_Gateway"
  }
}
