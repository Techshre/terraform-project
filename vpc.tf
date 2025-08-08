resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
  
    tags = {
      Name = "my-Vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1"

    tags = {
        Name = "public-subnet"
    }  
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1"

    tags = {
        Name = "Private-subnet"
    }  
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "my-igw"
    }
  
}

    resource "aws_route_table" "public" {
      vpc_id = aws_vpc.my_vpc.id
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw
      }
      tags = {
        Name = "public-route-table"
      }
    }

    resource "aws_route_table_association" "public_subnet_association" {
      subnet_id      = aws_subnet.public_subnet.id
      route_table_id = aws_route_table.public.id
    }
