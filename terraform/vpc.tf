# Resource: aws_vpc

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"

  # Makes your instances shared on the host, if dedicated AWS will charge for this.
  instance_tenancy = "default"

  # Required by EKS. Enable/disable DNS support in the VPC, true required.
  enable_dns_support = true

  # Required by EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Enable/disable ClassicLink for the VPC
  enable_classiclink = false

  # Enable/disable ClassicLink DNS support for the
  enable_classiclink_dns_support = false

  # Requests an Amazon-provided IPv6 CIDR block with a /56 preference
  assign_generated_ipv6_cidr_block = false

  # A map of tags to assign to the resource
  tags = {
    Name = "main"
  }
}

# Output some variables to be used later
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC Id."
  # Setting an output value as sensitive prevents Terraform from showing.
  sensitive = false
}