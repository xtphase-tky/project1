resource "aws_launch_template" "lt" {
  name_prefix   = "scalable-lt"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  iam_instance_profile {
    arn = var.instance_role_arn
  }

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y httpd
systemctl start httpd
echo "Scalable App Running" > /var/www/html/index.html
EOF
  )
}

resource "aws_autoscaling_group" "asg" {
  min_size         = 2
  max_size         = 5
  desired_capacity = 2

  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
  health_check_type = "ELB"
}

resource "aws_autoscaling_policy" "cpu_policy" {
  name                   = "cpu-scaling"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}	
