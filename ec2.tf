resource "aws_instance" "my_instance" {
  instance_type = var.aws_instance_type
  ami           = var.ami_id

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_root_config.volume_size
    volume_type           = var.ec2_root_config.volume_type
  }
  tags = {
    Name = "SampleServer"
  }
}
