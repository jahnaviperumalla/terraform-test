terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
    
}   

resource "aws_instance" "name" {
   ami = "ami1"
   instance_type = "type1"
   associate_public_ip_address = true
   key_name = "keyname1"
   
}