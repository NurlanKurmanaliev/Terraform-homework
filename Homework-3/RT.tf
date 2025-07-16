resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework3_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "private-rt"
  }
}


resource "aws_route_table_association" "public1-subnet" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public2-subnet" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_route_table_association" "private1-subnet" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private2-subnet" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}