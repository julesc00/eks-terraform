# Routing Table

resource "aws_route_table" "public" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  route {
    # The Cid block of the route.
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC internet gateway or a virtual private gatewary.
    gateway_id = aws_internet_gateway.main.id
  }

  # A map of tags to assign to the resource
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway in a AZ.
    gateway_id = aws_nat_gateway.gw1.id
  }

  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = ""

    # Identifier of a VPC NAT gateway in another AZ.
    gateway_id = aws_nat_gateway.gw2.id
  }

  tags = {
    Name = "private2"
  }
}
