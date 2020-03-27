# Instance Security group
resource "aws_security_group" "instance_ssh_access" {
  name        = "${upper(var.environment)}-${upper(var.account_name)}-PRI-BASTION-SG"
  description = "Managed by Terraform"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    self        = true
    cidr_blocks = ["${var.allowed_ips}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = "${upper(var.environment)}-${upper(var.account_name)}-PRI-BASTION-SG"
    },
  )
}

