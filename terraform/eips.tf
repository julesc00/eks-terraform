# Resource: aws_eip Elastic IP

resource "aws_eip" "nat1" {
  # EIP may require Internet Gateway to exist in the VPC prior to association
  # Use depends_on to set an explicit dependency on the Internet Gateway
  depends_on = [aws_internet_gateway.main]

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.main]
}
