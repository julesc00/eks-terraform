# Resource: subnets
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_1" {
  # Required, the CIDR block for the subnet
  cidr_block = "192.168.0.0/18"

  # Required
  vpc_id = aws_vpc.main.id

  # The AZ for the subnet
  availability_zone = "us-east-1a"

  # Required for EKS. Instances launched into the subnet should be assigned
  map_public_ip_on_launch = true

  # Important in this case: a map of tags to assign to the resource.
  tags = {
    Name                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {
  # Required, the CIDR block for the subnet, last subnet public_1 will end at 192.168.63.255
  cidr_block = "192.168.64.0/18"

  # Required
  vpc_id = aws_vpc.main.id

  # The AZ for the subnet
  availability_zone = "us-east-1b"

  # Required for EKS. Instances launched into the subnet should be assigned
  map_public_ip_on_launch = true

  # Important in this case: a map of tags to assign to the resource.
  tags = {
    Name                        = "public-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_1" {
  # Required, the CIDR block for the subnet
  cidr_block = "192.168.128.0/18"

  # Required
  vpc_id = aws_vpc.main.id

  # The AZ for the subnet
  availability_zone = "us-east-1a"

  # Important in this case: a map of tags to assign to the resource.
  tags = {
    Name                        = "public-us-east-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_2" {
  # Required, the CIDR block for the subnet, last subnet public_1 will end at 192.168.63.255
  cidr_block = "192.168.192.0/18"

  # Required
  vpc_id = aws_vpc.main.id

  # The AZ for the subnet
  availability_zone = "us-east-1b"

  # Important in this case: a map of tags to assign to the resource.
  tags = {
    Name                        = "public-us-east-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
