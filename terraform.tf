terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
     random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

terraform {
  backend "s3" {
    bucket = var.aws_s3_bucket.my_bucket.bucket
    key    = "./terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}

