resource "aws_vpc" "eks" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "az_1" {
  vpc_id               = aws_vpc.eks.id
  availability_zone_id = "use1-az1"
  cidr_block           = "10.0.1.0/24"
}

resource "aws_subnet" "az_2" {
  vpc_id               = aws_vpc.eks.id
  availability_zone_id = "use1-az2"
  cidr_block           = "10.0.2.0/24"
}