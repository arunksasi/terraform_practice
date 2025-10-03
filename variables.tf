variable "instance_name" {
    description = "Name of  the instane"
    type = string 
    default = "Dev_instance "

}

variable "instance_type" {
    description = "Type of the instance "
    type = string 
    default = "t2.micro"
  
}


variable "region" {
    description = "Region of the aws resources "
    type = string 
    default = "us-east-1"
  
}