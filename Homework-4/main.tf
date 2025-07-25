resource "aws_key_pair" "deployer" {
  key_name = var.key_name 
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}

resource "aws_instance" "web" {
  ami = var.ec2_web.ami_id  
  instance_type = var.ec2_web.instance_type 
 
  tags = local.common_tags
  
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc[0].cidr
  enable_dns_support   = var.vpc[0].enable_dns_support
  enable_dns_hostnames = var.vpc[0].enable_dns_hostnames
  tags = local.common_tags
}


resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[0].cidr_block
  availability_zone = var.subnets[0].az
  map_public_ip_on_launch = var.subnets[0].map_public_ip_on_launch

 
  tags = {
    Name = var.subnets[0].name
  }
}

resource "aws_subnet" "main2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[1].cidr_block
  availability_zone = var.subnets[1].az
  map_public_ip_on_launch = var.subnets[1].map_public_ip_on_launch

 
  tags = {
    Name = var.subnets[1].name
  }
}

resource "aws_subnet" "main3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[2].cidr_block
  availability_zone = var.subnets[2].az
  map_public_ip_on_launch = var.subnets[2].map_public_ip_on_launch

 
  tags = {
    Name = var.subnets[2].name
  }
}

resource "aws_subnet" "main4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[3].cidr_block
  availability_zone = var.subnets[3].az
  map_public_ip_on_launch = var.subnets[3].map_public_ip_on_launch

  tags = {
    Name = var.subnets[3].name
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.internet_gateway
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_table[0]
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.route_table[1]
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  count          = 2
  subnet_id      = aws_subnet.main3.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  count          = 2
  subnet_id      = aws_subnet.main4.id
  route_table_id = aws_route_table.private.id
}