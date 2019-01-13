# Find the right image pre built via packer
data "aws_ami" "base_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.linux_distribution}-BASE-v${var.ami_version}-*"]
  }

  owners = ["${var.ami_owner_account}"]
}
