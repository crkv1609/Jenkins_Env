#!/bin/bash

hostnamectl set-hostname Jenkins-Master

yum update -y

echo "Cyberbox" | passwd --stdin ec2-user

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

systemctl stop sshd.service
systemctl start sshd.service

yum install fontconfig -java-17-amazon-corretto-devel git -y

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install jenkins -y

systemctl start jenkins
systemctl status jenkins

yes '' | su - ec2-user -c "ssh-keygen -t RSA -f ~/.ssh/id_rsa"

netstat -nltp


