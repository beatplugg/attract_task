variable "access_key" {
	description = "AWS Access Key"
	type = string
	default = "YOUR_AWS_ACCESS_KEY"
}

variable "secret_key" {
	description = "AWS Secret Key"
	type = string
	default = "YOUR_AWS_SECRET_ACCESS_KEY"
}

variable "default_ami" {
	description = "AMI Used for EC2 instance launch"
	type = string
	default = ""
}