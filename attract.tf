provider "aws" {
  access_key = var.access_key
  secret_access_key = var.secret_key
  region = "eu-central-1"
}

resource "aws_vpc" "" {
  cidr_block = "/"
}

resource "aws_subnet" "" {
  vpc_id = aws_vpc. .id
  cidr_block = "/"
  availability_zone = ""
}

resource "aws_lb" "" {
  name = ""
  subnets = [aws_subnet. .id]
}

resource "aws_autoscaling_group" "" {
  desired_capacity = 3
  min_size = 1
  max_size = 5
  vpc_zone_identifier = [aws_subnet. .id]
}

resource "aws_instance" "" {
  ami = var.default_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet. .id
  user_data = 
}

resource "aws_eip" " " {
  vpc = true
}

resource "aws_eip_association" " " {
  instance_id   = aws_instance. .id
  allocation_id = aws_eip. .id
}

resource "aws_route53_zone" " " {
  name = " "
}

resource "aws_route53_record" " " {
  zone_id = aws_route53_zone. .id
  name    = " "
  type    = " "
  alias {
    name                   = aws_lb. .dns_name
    zone_id                = aws_lb. .zone_id
    evaluate_target_health = true
  }
}

output "instance_ip" {
        value = aws_eip. .public_ip
}