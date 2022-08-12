provider "aws"{
    profile = "terraform-admin"
    region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name	= "name"
    values 	= ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  
  owners = ["099720109477"]  # canonical ubuntu AWS account id
}

resource "aws_instance" "test-pipeline" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    tags = {
        Name = "test2-ec2"
    }
}