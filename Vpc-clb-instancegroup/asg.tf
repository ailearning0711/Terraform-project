resource "aws_launch_template" "webserver" {
  name_prefix   = "webserver-"
  image_id      = var.webservers_ami
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.webservers.id
  ]

  user_data = filebase64("${path.module}/install_httpd.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG-Webserver"
    }
  }
}

resource "aws_autoscaling_group" "webserver" {
  name = "webserver-asg"

  min_size         = 2
  desired_capacity = 2
  max_size         = 4

  vpc_zone_identifier = aws_subnet.public[*].id

  launch_template {
    id      = aws_launch_template.webserver.id
    version = "$Latest"
  }

  load_balancers = [
    aws_elb.tera_elb.name
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "ASG-Webserver"
    propagate_at_launch = true
  }
}