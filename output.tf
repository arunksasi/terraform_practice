output "ami_id" {
  value = data.aws_ami.ubuntu.id

}

output "instance_name" {

    value = var.instance_name
  
}

output "subnet_id_public" {
    
   

    value = [for subnet in  module.vpc.aws.subnet.public : subnet.id  ]
  
}


output "subnet_id_private" {

    value =  [for subnet in module.vpc.aws.subnet.private : subnet.id]
  
}