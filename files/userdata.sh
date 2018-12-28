#!/usr/bin/env bash
cd /tmp
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
yum install -y epel-release
yum install -y python-pip && pip install pip -U && pip install ansible -U
