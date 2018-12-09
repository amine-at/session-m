resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  key_name             = "${aws_key_pair.mykeypair.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
  user_data            = "#!/bin/bash\nsudo yum update\ncurl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb -o session-manager-plugin.deb\nsudo dpkg -i session-manager-plugin.deb"
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = ["${var.subnet_1}", "${var.subnet_2}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfig.name}"
  min_size             = 2
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "SessionManager"
      propagate_at_launch = true
  }
}
