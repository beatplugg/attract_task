provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_access_key = "YOUR_AWS_SECRET_ACCESS_KEY"
  region = "eu-central-1"
}

resource "aws_vpc" "attract_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "attract_subnet_az1" {
  vpc_id = aws_vpc.attract_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
}

resource "aws_subnet" "attract_subnet_az2" {
  vpc_id = aws_vpc.attract_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
}

resource "aws_lb" "attract_load_balancer" {
  name = "Attract Project Load Balancer"
  subnets = [aws_subnet.attract_subnet_az1.id, aws_subnet.attract_subnet_az2.id]
}

resource "aws_autoscaling_group" "frontend_autoscaling_group" {
  desired_capacity = 3
  min_size = 1
  max_size = 5
  vpc_zone_identifier = [aws_subnet.attract_subnet_az1.id, aws_subnet.attract_subnet_az2.id]
}

resource "aws_instance" "rabbitmq_instance" {
  ami = var.default_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.attract_subnet_az1.id
  user_data = 
}

resource "aws_instance" "memcached_instance1" {
  count = 2
  ami = var.default_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.attract_subnet_az1.id
  user_data = 
}

resource "aws_instance" "memcached_instance2" {
  count = 2
  ami = var.default_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.attract_subnet_az2.id
  user_data = 
}

resource "aws_instance" "mariadb_instance" {
  ami = var.default_ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.attract_subnet_az2.id
  user_data = 
}

resource "aws_eip" "elastic_ip" {
  vpc = true
}

resource "aws_eip_association" "elastic_ip_association" {
  instance_id   = aws_instance.rabbitmq_instance.id
  allocation_id = aws_eip.elastic_ip.id
}

resource "aws_route53_zone" "zone" {
  name = "example.com"
}

resource "aws_route53_record" "load_balancer_record" {
  zone_id = aws_route53_zone.zone.id
  name    = "example.com"
  type    = "A"
  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "frontend_record" {
  zone_id = aws_route53_zone.zone.id
  name    = "frontend.example.com"
  type    = "A"
  alias {
    name                   = aws_lb.load_balancer.dns_name
    zone_id                = aws_lb.load_balancer.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "backend_record" {
  zone_id = aws_route53_zone.zone.id
  name    = "backend.example.com"
  type    = "A"
  alias {
    name                   = aws_instance.rabbitmq_instance.private_ip
    zone_id                = aws_route53_zone.zone.id
    evaluate_target_health = true
  }
}

output "instance_ip" {
        value = aws_eip.XXX.public_ip
}

