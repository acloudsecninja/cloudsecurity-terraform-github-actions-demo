resource "aws_vpc" "acloudsecninja-test-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "acloudsecninja-test-vpc"
  }
}

resource "aws_subnet" "acsntest-public-subnet" {
  vpc_id                  = aws_vpc.acloudsecninja-test-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"

  tags = {
    Name = "acsntest-public-subnet"
  }
}

resource "aws_internet_gateway" "acsntest-internet_gateway" {
  vpc_id = aws_vpc.acloudsecninja-test-vpc.id

  tags = {
    Name = "acsntest-internet_gateway"
  }
}

resource "aws_route_table" "acsntest-public_rt" {
  vpc_id = aws_vpc.acloudsecninja-test-vpc.id

  tags = {
    Name = "acsntest-public_rt"
  }
}

resource "aws_route" "acsntest-default_route" {
  route_table_id         = aws_route_table.acsntest-public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.acsntest-internet_gateway.id
}

resource "aws_route_table_association" "acsntest-public_assoc" {
  subnet_id      = aws_subnet.acsntest-public-subnet.id
  route_table_id = aws_route_table.acsntest-public_rt.id
}

resource "aws_security_group" "acsntest-default-sg" {
  name        = "Default Security-Group-Limited-Access"
  description = "Default Security-Group-Limited-Access"
  vpc_id      = aws_vpc.acloudsecninja-test-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["73.144.80.53/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "acloudsecninja-test-server" {
  instance_type          = "t2.nano"
  ami                    = data.aws_ami.ubuntu_latest_AMI.id
  vpc_security_group_ids = [aws_security_group.acsntest-default-sg.id]
  subnet_id              = aws_subnet.acsntest-public-subnet.id
  key_name               = aws_key_pair.acloudsecninja-mgmt-key.key_name

  user_data = <<-EOF
  #!/bin/bash -ex

   apt-get update -y 
   apt-get upgrade -y 
  EOF

  root_block_device {
    volume_size = 20
  }
  tags = {
    Name = "acloudsecninja-test-server"
  }
}