variable "aws_instance_type" {
    type = string
    default = "t2.micro" 
}

variable "ami_id" {
    type = string
    default = "ami-0f918f7e67a3323f0"
}

variable "ec2_root_config" {
    type = object({
      volume_size = number
      volume_type = string 
    })
    default = {
      volume_size = 10
      volume_type = "gp2"
    }
}
