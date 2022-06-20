terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region = var.region
}


# //********ssh key generation

resource "tls_private_key" "keygen" {
  algorithm   = "RSA"  
}

//*********Creating key pair in aws

resource "aws_key_pair" "newKey" {
depends_on=[
	tls_private_key.keygen
]
  key_name   = "webkey1"
  public_key = tls_private_key.keygen.public_key_openssh
}

//**********Saving private key in local file

resource "local_file" "privatekey" {
depends_on=[
	aws_key_pair.newKey
]
    content     = tls_private_key.keygen.private_key_pem
    filename = "C:/Users/lgundlapalli/Downloads/webkey1.pem"
}

resource "aws_default_vpc" "default" {
  # Default is true, if you omit this, TF will enable it.
  enable_dns_support = false
}
resource "aws_instance" "ami_ec2_test" {  
  ami = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone = var.availability_zone
  cpu_core_count = 8
  cpu_threads_per_core = 1
  capacity_reservation_specification {    
    capacity_reservation_preference = var.capacity_reservation_preference
  }


  #disable_api_termination = each.value.disable_api_termination
  
  ebs_block_device {
    #delete_on_termination = each.value.delete_on_termination
    device_name = var.device_name
    encrypted = var.encrypted
    #iops = var.iops
    kms_key_id = var.kms_key_id
   # snapshot_id = each.value.snapshot_id
    tags = var.tags
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  #ebs_optimized = each.value.ebs_optimized
  #get_password_data = each.value.get_password_data
  #hibernation = each.value.hibernation
  host_id = var.host_id
  iam_instance_profile = var.iam_instance_profile
  instance_type = var.instance_type
  key_name = var.key_name
  #monitoring = each.value.monitoring
  #private_ip = var.private_ip
  #secondary_private_ips = var.secondary_private_ips
  security_groups = var.security_groups
  #source_dest_check = each.value.source_dest_check
  subnet_id = var.subnet_id
  tenancy = var.tenancy
  tags = {
    Name ="ec2_ami_test"
    Environment = "DEV"
    OS = "Windows"    
  }
}

# resource "aws_volume_attachment" "ebs_att1" {
#   device_name = "/dev/sda1"
#   volume_id   = aws_ebs_volume.vol1.id
#   instance_id = aws_instance.ami_ec2_test.id
# }

# resource "aws_volume_attachment" "ebs_att2" {
#   device_name = "xvdl"
#   volume_id   = aws_ebs_volume.vol2.id
#   instance_id = aws_instance.ami_ec2_test.id
# }

# resource "aws_ebs_volume" "vol1" {
#   availability_zone = "us-west-2a"
#   encrypted              = true
#   snapshot_id = var.snapshot_id
#   #size = 100
#   type = "gp2"
#   kms_key_id = var.kms_key_id
#   tags = {
#             "Name": "stg-usw2a-gfwsl-mssql-01", 
#             "Application": "gfwsl",            
#             "Env":"stg"
#          }
# }

# resource "aws_ebs_volume" "vol2" {
#   availability_zone = "us-west-2a"
#   encrypted              = true
#   snapshot_id = var.snapshot_id
#   size = 50
#   type = "gp3"
#   iops = 3000
#   kms_key_id = var.kms_key_id
#   tags = {
#             "Name": "stg-usw2a-gfwsl-mssql-01", 
#             "Application": "gfwsl",            
#             "Env":"stg"
#          }
# }


# resource "aws_network_interface_attachment" "test" {
#   instance_id          = aws_instance.ami_ec2_test.id
#   network_interface_id = var.network_interface_id
#   device_index         = 0
# }
