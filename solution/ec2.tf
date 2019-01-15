# Uncomment resources below and add required arguments.

resource "aws_security_group" "arns" {
  name = "launch-wizard-1"

  description = "Test security group."
  vpc_id = "vpc-526e7429"
}

resource "aws_security_group_rule" "ssh_ingress_access" {
  type            = "ingress"
  security_group_id = "sg-09aa38a8477382ca1"
  protocol = "tcp"
  from_port       = 0
  to_port         = 65535
  cidr_blocks = [ "0.0.0.0/0" ] 
}

resource "aws_security_group_rule" "egress_access" {
  security_group_id = "sg-09aa38a8477382ca1"
  type            = "egress"
  protocol = "tcp"
  from_port       = 0
  to_port         = 65535
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_instance" "arn1" {
  subnet_id = "subnet-9630ecca"
  count = "3"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-09aa38a8477382ca1" ]
  associate_public_ip_address = true
  # user_data = "${file("../shared/user-data.txt")}"
  tags {
    Name = "web-deploy"
  }
  
  # Keep these arguments as is:
  ami = "ami-0ac019f4fcb7cb7e6"
  availability_zone = "us-east-1a"
}

