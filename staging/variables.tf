variable "region" {
  description = "This is the cloud hosting region where your webapp will be deployed."
  default = "us-west-2"
}

variable "staging_prefix" {
  description = "This is the environment where your webapp is deployed. staging"
}

# variable "configuration" {
#   description = "The total configuration, List of Objects/Dictionary"  
#   default = [{}]
# }

variable "no_of_instances" {
  default = "1"
}
variable "ami" {
 
  description = "This is the instance image that will be taken as reference to launch a new instance."
  default = "ami-0218983c714b549f8"
}

variable "associate_public_ip_address" {
  description = "Enable public ip address or not"
}

variable "availability_zone" {
  description = "These are the availability zones in which new instances are launched"
  default = [{}]
}

variable "cpu_core_count" {
  description = "This defines the number of VCPU cores"
  default = [{}]
}

variable "disable_api_termination" {
  description = "This determines if API termination is required"
}

variable "ebs_optimized" {
  description = "This determines if EBS volume will be optimized"
}

variable "get_password_data" {
  description = "This enables to get password data"
}

variable "hibernation" {
  description = "This option tells if the new instance hibernation is supported"
} 

variable "host_id" {
  description = "Host Ids to which this instance belongs to"
  default = [{}]
}

variable "iam_instance_profile" {
  description = "What instance profile this new instance belongs to"
}

variable "instance_type" {
  description = "The instance type to which this belongs to"
}

variable "key_name" {
  description = "The key value pair options"
}

variable "monitoring" {
  description = "The monitoring tag describes if its enabled or not"
}

variable "private_ip" {
  description = "The private ip address of the new instances"
}

variable "secondary_private_ips" {
  description = "The secondary private ip configuration"
  default = [{}]
}

variable "security_groups" {
  description = "The security groups to which these new instances will belong to"
  default = [{}]
}

variable "source_dest_check" {
  description = "This sets if source destination check"
}

variable "subnet_id" {
  description = "The subnet ip addresses"
}

variable "tags" {
  description = "The tags used for the new isntances"
  default = [{}]
}

variable "tenancy" {
  description = "The tenancy single/multi"
}

variable "capacity_reservation_preference" {
  description = "The capacity reservation preference value for new isntance"
}

variable "delete_on_termination" {
  description = "EBS volume configuration"
}

variable "device_name" {
  description = "The EBS device volume"
}

variable "encrypted" {
  description = "To determine if volume is encrypted or not"
}

variable "iops" {
  description = "The input output per seconds supported byt eh EBS"
}

variable "kms_key_id" {
  description = "The kms key value id"
}

variable "snapshot_id" {
  description = "EBS snapshot id"
}

variable "ebstags" {
  description = "The tags for ebs value"
  default = [{}]
}

variable "volume_size" {
  description = "The EBS volume size"
}

variable "volume_type" {
  description = "The EBS volume type"
}

variable "ebs_delete_on_termination" {
  description = "The ebs option for deletion"
}

variable "enclave_enabled" {
  description = "The enclave enable options"
}

variable "auto_recovery" {
  description = "The auto recovery option"
}

variable "nic_delete_on_termination" {
  description = "The NIC card deleteion iption after termination"
}

variable "nic_device_index" {
  description = "The nic card device index"
}

variable "network_card_index" {
  description = "The nic card index default"
}

variable "network_interface_id" {
  description = "The network nic card itnerface id description"
}

