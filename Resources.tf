data "aws_ami" "Jenkins_instance" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_security_group" "Jenkins_sg" {
  name        = "Jenkins_sg"
  description = "Allow SSH & HTTP inbound traffic and all outbound traffic"


     dynamic "ingress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port    = port.value
        to_port      = port.value
        protocol     = "tcp"
        cidr_blocks  = var.sg_cidr_block   //["0.0.0.0/0"]
      }
    }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr_block
   
  }

  tags = var.sg_tags
}

resource "aws_instance" "Jenkins_Master" {
    ami            = data.aws_ami.Jenkins_instance.id 
    instance_type  = var.instance_type  
    key_name       = var.key_pair       
    vpc_security_group_ids = [aws_security_group.Jenkins_sg.id]
    user_data = file(var.jenkins_master_scripts)  

     tags = var.Jenkins_Master_tags

     
    }

    
resource "aws_instance" "Jenkins_Slave" {
    ami            = data.aws_ami.Jenkins_instance.id 
    instance_type  = var.instance_type  
    key_name       = var.key_pair       
    vpc_security_group_ids = [aws_security_group.Jenkins_sg.id]
    user_data = file(var.jenkins_slave_scripts)  

     tags = var.Jenkins_Slave_tags

     
    }
