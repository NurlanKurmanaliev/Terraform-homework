
data "aws_ami" "ubuntu-image" {
  most_recent = true
 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  
  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "ubuntu" {
  ami                         = data.aws_ami.ubuntu-image.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public1.id
  vpc_security_group_ids      = [aws_security_group.homework-3.id]
  user_data = file("apache2.sh")
  

  tags = {
    Name = "Ubuntu"
  }
}

data "aws_ami" "Amazon-image" {
  most_recent = true
 
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  
  owners = ["137112412989"] # Canonical
}


resource "aws_instance" "amazon" {
  ami                         = data.aws_ami.Amazon-image.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public2.id
  vpc_security_group_ids      = [aws_security_group.homework-3.id]
  user_data = file("apache.sh")
  

  tags = {
    Name = "Amazon"
  }
}