########################################################################################
#ALB Instance Target Group
########################################################################################
resource "aws_lb_target_group" "alb_target_group" {
  name     = "application-load-balancer"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.dev_vpc.id
}


########################################################################################
#ALB Target Group Attachment
########################################################################################
# resource "aws_lb_target_group_attachment" "attachment_ec2_one" {
#   target_group_arn = aws_lb_target_group.alb_target_group.arn
#   target_id        = aws_instance.dev_private_ec2_1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "attachment_ec2_two" {
#   target_group_arn = aws_lb_target_group.alb_target_group.arn
#   target_id        = aws_instance.dev_private_ec2_2.id
#   port             = 80
# }

########################################################################################
#ALB Listener
########################################################################################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.internet_facing_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

########################################################################################
#Application Load Balancer
########################################################################################
resource "aws_lb" "internet_facing_alb" {
  name                       = "dev-test-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_2a.id]
  enable_deletion_protection = false


  tags = {
    Environment = "production Environment"
  }
}