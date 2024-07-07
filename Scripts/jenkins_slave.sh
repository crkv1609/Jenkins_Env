#!/bin/bash

hostnamectl set-hostname Jenkins-Slave

yum update -y

echo "Cyberbox" | passwd --stdin ec2-user

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

systemctl stop sshd.service
systemctl start sshd.service

yum install fontconfig -java-17-amazon-corretto-devel docker git -y



systemctl start docker
systemctl enable docker

usermod -aG docker ec2-user
