resource "aws_subnet" "private1" {
    vpc_id     = aws_vpc.kaizen.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-west-2c"
    

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
    vpc_id     = aws_vpc.kaizen.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-west-2d"
   

  tags = {
    Name = "private2"
  }
}
