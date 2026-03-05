########################################################################################
# EC2S
########################################################################################
#BASTION EC2 IN SUBNET 2.
resource "aws_instance" "Bastion_host_ec2" {
  ami                         = var.AMMID
  instance_type               = var.EC2_type
  associate_public_ip_address = true
  key_name                    = var.key_pair
  subnet_id                   = aws_subnet.public_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.bastion_host.id]

  tags = { Name = "Bastion Host EC2" }
}

# #Private EC2 IN SUBNET 1b
# resource "aws_instance" "dev_private_ec2_1" {
#   ami                         = var.AMMID
#   instance_type               = var.EC2_type
#   associate_public_ip_address = false
#   key_name                    = var.key_pair
#   subnet_id                   = aws_subnet.private_subnet_1b.id
#   vpc_security_group_ids      = [aws_security_group.ssg_private_subnet.id]

#   tags = { Name = "Private EC2 Subnet 1b" }
# }

# #Private EC2 IN SUBNET 2b
# resource "aws_instance" "dev_private_ec2_2" {
#   ami                         = var.AMMID
#   instance_type               = var.EC2_type
#   associate_public_ip_address = false
#   key_name                    = var.key_pair
#   subnet_id                   = aws_subnet.private_subnet_2b.id
#   vpc_security_group_ids      = [aws_security_group.ssg_private_subnet.id]

#   tags = { Name = "Private EC2 Subnet 2b" }
# }
