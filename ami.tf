provider "aws" {
  region = "us-east-2"
}

data "aws_ami" "latest_ubuntu" { 
    owners = [ "099720109477" ]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
}

data "aws_ami" "latest_amazon_linux" {  
    owners = [ "amazon" ]
    most_recent = true
    filter {
        value = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}

output "latest_amazon_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "latest_amazon_ami_name" {
  value = data.aws_ami.latest_amazon_linux.name
}