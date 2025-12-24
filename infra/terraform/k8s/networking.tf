resource "aws_vpc" "eks" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "elb" {
  vpc_id     = aws_vpc.eks.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "nat" {
  vpc_id     = aws_vpc.eks.id
  cidr_block = "10.0.2.0/24"
}

# TODO: 2 private subnets (for worker nodes)
# TODO: route tables

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks.id
}

resource "aws_nat_gateway" "ngw" {
  subnet_id  = ""
  depends_on = [aws_internet_gateway.igw]
}