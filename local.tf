provider "aws" {
  region = "us-east-1"
}

locals {
  common_tags = {
    Team = "DevOps"
    Project = "Jio"
  }
}
resource "aws_instance" "app-dev" {
   ami = "ami-00c39f71452c08778"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_instance" "db-dev" {
   ami = "ami-00c39f71452c08778"
   instance_type = "t2.small"
   tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = local.common_tags
}
