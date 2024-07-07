// name = value
// data types: interger, string, boolean, list, dictionary

// image_id = "ami-04629cfb3bd2d73f3"

variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "image_id" {
    type = string
    default = "ami-04629cfb3bd2d73f3"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "Terraform_key"
}


variable "jenkins_master_scripts" {
    type = string
    default = "./scripts/jenkins_master.sh"
}


variable "jenkins_slave_scripts" {
    type = string
    default = "./scripts/jenkins_slave.sh"
}


variable "Jenkins_Master_tags" {
    type = map(string)
    default = {
      "Name" = "Jenkins_Master"
      "Owner" = "crkv"
    }
}


variable "Jenkins_Slave_tags" {
    type = map(string)
    default = {
      "Name" = "Jenkins_Slave"
      "Owner" = "crkv"
    }
}


variable "sg_ports" {
    type = list(number)
    default = [ 8080, 22 ]
}


variable "sg_cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}


variable "sg_tags" {
    type = map(string)
    default = {
      "Name" = "Jenkins SG"
      "Owner" = "crkv"
    }
}