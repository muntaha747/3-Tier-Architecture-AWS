########################################################################################
#Subnets
########################################################################################
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_1a
  map_public_ip_on_launch = true
  availability_zone       = var.az_1a

  tags = { Name = "public_subnet_1a" }
}

resource "aws_subnet" "public_subnet_2a" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_2a
  map_public_ip_on_launch = true
  availability_zone       = var.az_1b

  tags = { Name = "public_subnet_2a" }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_1b
  map_public_ip_on_launch = false
  availability_zone       = var.az_1a

  tags = { Name = "private_subnet_1b" }
}

resource "aws_subnet" "private_subnet_2b" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_2b
  map_public_ip_on_launch = false
  availability_zone       = var.az_1b

  tags = { Name = "private_subnet_2b" }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_1c
  map_public_ip_on_launch = false
  availability_zone       = var.az_1a

  tags = { Name = "private_subnet_1c" }
}


resource "aws_subnet" "private_subnet_2c" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet_2c
  map_public_ip_on_launch = false
  availability_zone       = var.az_1b

  tags = { Name = "private_subnet_2c" }
}

