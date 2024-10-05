terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

######## Travel Memory VPC #######
resource "aws_vpc" "tm_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tm-VPC"
    AppName = var.TravelMemoryApp
  }
}

####### Default Network ACL rule applied by AWS #######
resource "aws_default_network_acl" "tm_nacl" {
  default_network_acl_id = aws_vpc.tm_vpc.default_network_acl_id

  ingress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0"
    from_port = 0
    to_port = 0
  }

  egress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "tm-NACL"
    AppName = var.TravelMemoryApp
  }
}

####### Travel Memory Public Subnet ######
resource "aws_subnet" "tm_pub_subnet" {
  vpc_id = aws_vpc.tm_vpc.id
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "tm-pub-subnet"
    AppName = var.TravelMemoryApp
  }
}

###### Travel Memory Private Subnet ######
resource "aws_subnet" "tm_pvt_subnet" {
  vpc_id = aws_vpc.tm_vpc.id
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "tm-pvt-subent"
    AppName = var.TravelMemoryApp
  }
}

###### Travel Memory IGW #######
resource "aws_internet_gateway" "tm_igw" {
  vpc_id = aws_vpc.tm_vpc.id

  tags = {
    Name = "tm-igw"
    AppName = var.TravelMemoryApp
  }
}

###### Travel Memory Route Table ######
resource "aws_route_table" "tm_route_table" {
  vpc_id = aws_vpc.tm_vpc.id
  route = {
    cidr_block = "0.0.0.0"
    gateway_id = aws_internet_gateway.tm_igw.id
  }

  tags = {
    Name = "tm-route-table"
    AppName = var.TravelMemoryApp
  }
}

###### Travel Memory Associating Route table to Public Subnet #######
resource "aws_route_table_association" "tm_route_table_assocation" {
  subnet_id = aws_subnet.tm_pub_subnet.id
  route_table_id = aws_route_table.tm_route_table.id
}

###### Security Group ######
resource "aws_security_group" "tm_security_group" {
  vpc_id = aws_vpc.tm_vpc.id

  ingress {
    from_port   = 80   # Allow HTTP traffic
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443   # Allow HTTP traffic
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tm-security-group"
    AppName = var.TravelMemoryApp
  }
}