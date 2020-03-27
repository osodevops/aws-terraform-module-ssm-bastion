output "bastion_public_ip" {
  value = aws_instance.ec2_with_ssm_agent.public_ip
}

output "bastion_private_ip" {
  value = aws_instance.ec2_with_ssm_agent.private_ip
}

