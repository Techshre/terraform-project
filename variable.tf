variable "aws_instance_type" {
    type = string
    validation {
      condition = var.aws_instance_type=="t2.micro" || var.aws.instance_type=="t3.micro"
      error_message = "t2 and t3.micro values allowed"
    } 
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
