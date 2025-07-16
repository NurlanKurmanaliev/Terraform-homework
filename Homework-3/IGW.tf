resource "aws_internet_gateway" "homework3_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "kaizen"
  }
}

