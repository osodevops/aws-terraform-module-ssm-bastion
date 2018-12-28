# Create test instance with ssm agent installed
# Find the right image pre built via packer
data "aws_ami" "rhel_base" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-BASE-${var.ami_version}-*"]
  }

  owners = ["${var.ami_owner_account}"]
}
