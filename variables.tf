variable "vpc_id" {}
variable "ssh_public_key" {}
variable "instance_type" {}
variable "ssm_standard_role" {}
variable "subnet_id" {}
variable "aws_region" {}
variable "ssm_tag_name" {}
variable "ssm_tag_value" {}
variable "ami_owner_account" {}
variable "ami_version" {}
variable "environment" {}
variable "allowed_ips" {}
variable "linux_distribution" {}

variable "common_tags" {
  type = "map"
}
