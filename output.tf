output "ami_id" {
  value = data.aws_ami.ubuntu.id

}

output "instance_name" {

    value = var.instance_name
  
}

output "subnet_id_public" {
    
   

    value =  module.vpc.public_subnets
  
}


output "subnet_id_private" {

    value =   module.vpc.private_subnets 
  
}