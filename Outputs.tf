output "Jenkins_Master_Public_IP" {
    value = aws_instance.Jenkins_Master.public_ip
}

 output "Jenkins_Master_Private_IP" { 
    value = aws_instance.Jenkins_Master.private_ip
}
output "Jenkins_Slave_Public_IP" {
    value = aws_instance.Jenkins_Slave.public_ip
}

 output "Jenkins_Slave_Private_IP" { 
    value = aws_instance.Jenkins_Slave.private_ip
}