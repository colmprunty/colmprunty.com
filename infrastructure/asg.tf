resource "aws_launch_template" "homepage_template" {
  name_prefix = "colmprunty"
  image_id = "ami-05b65c0f6a75c1c64"
  instance_type = "t2.micro"

  instance_market_options {
    market_type = "spot"
  }

  network_interfaces {
    associate_public_ip_address = false
  }
}

resource "aws_autoscaling_group" "homepage_asg" {
  availability_zones = ["eu-west-1c"]
  desired_capacity = 1
  max_size = 1
  min_size = 1
  launch_template = {
    id = "${aws_launch_template.homepage_template.id}"
    version = "$$Latest"
  }
}
