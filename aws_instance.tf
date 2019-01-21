resource "aws_instance" "ec2_with_ssm_agent" {
  ami                         = "${data.aws_ami.base_ami.image_id}"
  iam_instance_profile        = "${aws_iam_instance_profile.ssm_bastion_instance_profile.name}"
  instance_type               = "${var.instance_type}"
  vpc_security_group_ids      = ["${aws_security_group.instance_ssh_access.id}"]
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.subnet_id}"

  depends_on = ["aws_security_group.instance_ssh_access"]

  lifecycle {
    ignore_changes = ["user_data"]
  }


  tags = "${merge(var.common_tags,
    map("Name", "${upper(var.environment)}-${upper(var.account_name)}-BASTION-EC2"),
    map("Description","bastion"),
    map("role","bastion"),
    map("sshUser","centos")
  )}"
}