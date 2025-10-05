
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical's official AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"
  
  name = "My-VPC_with-terraform"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
  public_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]


  enable_nat_gateway = false
  enable_dns_hostnames = true  

  tags = {

    terraform = true
    Environment= "dev"
  }

  
}



resource "aws_instance" "appserver" {

  ami = data.aws_ami.ubuntu.id
  instance_type =  var.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.public_subnets[2]

 tags = {

  name =  "First_Terraform instance"


 } 
}



