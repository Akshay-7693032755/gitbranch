//  create a ec2 instance  with swecurioty group


provider "aws" {
  region     = "ap-northeast-2"
  access_key = 
  secret_key = 
}

resource "aws_instance" "this_instance" {
  ami = "ami-0382ac14e5f06eb95"
  instance_type = "t2.micro"
  availability_zone = "ap-northeast-2a"
  vpc_security_group_ids = [aws_security_group.this_security_group.id]
    key_name = "seoul"
  tags = {
    Name = "Instance_AC"
  }
  
}

resource "aws_security_group" "this_security_group" {
  name = "Mg_Sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    from_port   = 80
    to_port     = 80
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
    name = "Security_Group_AC"
  }

}

