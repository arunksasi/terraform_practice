data "aws_ami" "ubuntu"{

    most_recent = true 
    owners = ["099720109477"] # Canonical's official AWS account ID
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/"] 

     
    }

    filter {
      name ="virtualization-type "
      values = ["hvm"]
    }

}