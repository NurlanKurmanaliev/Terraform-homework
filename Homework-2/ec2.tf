resource "aws_instance" "web" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  #availability_zone = "us-west-2b"
  subnet_id = "subnet-00f0e4e711d83b021"
  key_name = "bastion-key"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-1"
  }
}

resource "aws_instance" "web-2" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  #availability_zone = "us-west-2c"
  subnet_id = "subnet-05378a2984118b369"
  key_name = "bastion-key"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-2"
  }
}

resource "aws_instance" "web-3" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  #availability_zone = "us-west-2a"
  subnet_id = "subnet-005a2cab357374858"
  key_name = "bastion-key"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")

  tags = {
    Name = "web-3"
  }
}