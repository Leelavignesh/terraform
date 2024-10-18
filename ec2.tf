resource "aws_instance" "sample" {
  #count = 3
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  
  tags = {
    type = "map"
    Name = "sample"
  }
}

resource "aws_security_group" "allow-ssh" {
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    type = "map"
    Name = "allow-ssh"
  }
}