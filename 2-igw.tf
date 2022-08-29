resource "aws_internet_gateway" "alon-new-igw" {
  vpc_id = aws_vpc.alon-vpc-eks.id

  tags = {
    Name = "igw"
  }
}
