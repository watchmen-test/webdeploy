provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}


variable "instance_type" { default="t2.micro"}
variable "ami" { default="ami-6871a115" }

resource "aws_instance" "ec2" {
  count         = 3 
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = ""
}

