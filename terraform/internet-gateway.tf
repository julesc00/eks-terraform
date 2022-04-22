# Resource: Internet Gateway

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  # Optional, a map of tags to assign to the resource.
  tags = {
    Name = "main"
  }
}