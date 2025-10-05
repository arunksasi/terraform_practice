# Initialize vpc o module 

module "vpc_main" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"
}




variable "instance_name" {
  description = "Name of  the instane"
  type        = string
  default     = "Dev_instance "

}

variable "instance_type" {
  description = "Type of the instance "
  type        = string
  default     = "t2.micro"

}


variable "region" {
  description = "Region of the aws resources "
  type        = string
  default     = "us-east-1"

}


variable instance_configs{

  description = "Mapings for instance  configurations "
  type = map(object({

      ami= string
      instance_type = string
      key_name =  string


  }))

  default = {
    "Webserver1" = {

      ami = data.aws_ami.ubuntu.id
      instance_type = "t2.micro"
      key_name =  "Ansible_key_per"


    },

    "Webserver2" = {
    ami = data.aws_ami.ubuntu.id
      instance_type = "t2.micro"
      key_name =  "Ansible_key_per"
    }
  }


}