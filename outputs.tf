utput "public_ip" {
    value = aws_instance.my_instance.public_ip
}

output "s3_public_dns" {
    value = aws_instance.my_instance.id
  
}
