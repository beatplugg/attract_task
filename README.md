# Attract Group Tasks

## Description
This repository is a part of technical task given by Attract Group. It is being used to share theoretical part of the task (architectural diagram of the project on AWS Cloud) and set up a Docker application consisting of 2 components: NGINX and PHP. 

# NGINX and PHP Docker Application

## Requirements

- Linux;
- Docker;
- Docker Compose.

## Application launch steps 

- Clone the repository
- Run 'cd attract_task'
- Run 'docker swarm init'
- Run 'docker stack deploy -c docker-compose.yml <name_of_the_stack>'
- Use the browser to connect to the running page (you will see a page with description of practical task and links to my profiles)

# Theoretical part

In Theoretical part directory you can find AWS Diagram.pdf and AWS Diagram.drawio files. Diagram describes the web-application service running on AWS. You can see pulbic subnet with EIP and NAT Gateway forwarding ports to private VPC subnets, such as Web Subnet, App Subnet and DB Subnet. The app is being hosted in two availability zones and EC2 frontend and backend servers are belong to two different Auto Scaling groups called Web App and App. They are also covered by security groups, just like RDS instances. Backend services have one EFS Shared storage and they are also storing their logs in S3 Bucket. Frontend services are storing their backups and other data in S3 bucket too. You can also see a Amazon RDS databases: one master node and one standby node. The Web App and App instances are using Elastic Load Balancing. At the exit from the virtual private cloud, we connect to the DNS service Route 53 which provides a DNS name for end users. The whole project is also covered by AWS Shield in order to prevent DDoS ​​attacks on our application.

# P.S.

All parts of the practical task were launched and tested on an EC2 Ubuntu instance in AWS Cloud.