resource "aws_iam_role" "ssm_role" {
  name               = "ssm-terraform"
  assume_role_policy = "${file("${path.module}/files/ssm_role_policy.json")}"
}

resource "aws_iam_role_policy_attachment" "ssm_standard" {
  role       = "${aws_iam_role.ssm_role.name}"
  policy_arn = "${var.ssm_standard_role}"
}

resource "aws_iam_instance_profile" "ssm_bastion_instance_profile" {
  name = "ssm-bastion-instance-profile"
  role = "${aws_iam_role.ssm_role.name}"
}
