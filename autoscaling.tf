########################################################################################
#Autoscaling group
########################################################################################
resource "aws_autoscaling_group" "autoscaling_group" {
  name             = "3_tier_architecture_autoscaling"
  min_size         = 2
  max_size         = 10
  desired_capacity = 2

  vpc_zone_identifier = [
    aws_subnet.private_subnet_1b.id,
    aws_subnet.private_subnet_2b.id
  ]

  # Connect to ALB Target Group
  target_group_arns = [
    aws_lb_target_group.alb_target_group.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  # Use Launch Template
  launch_template {
    id      = aws_launch_template.autoscaling_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "AutoScaling-App-Instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  force_delete = true
}

########################################################################################
#Autoscaling launch template
########################################################################################
resource "aws_launch_template" "autoscaling_template" {
  name_prefix   = "autoscaling-template-"
  image_id      = var.AMMID
  instance_type = var.EC2_type
  key_name      = var.key_pair

  vpc_security_group_ids = [
    aws_security_group.ssg_private_subnet.id
  ]

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y nginx
echo "<h1>AutoScaling App Server</h1>" > /usr/share/nginx/html/index.html
systemctl start nginx
systemctl enable nginx
EOF
  )
}

