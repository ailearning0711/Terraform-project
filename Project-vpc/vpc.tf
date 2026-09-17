resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpcblock
  instance_tenancy = "default"

  tags = {
    Name = var.vpc
  }
}

resource "aws_subnet" "public_sub1" {
  availability_zone       = "us-west-2a"
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = var.pub_sub1block
  map_public_ip_on_launch = true

  tags = {
    Name = var.tagpubsub1
  }
}

resource "aws_subnet" "public_sub2" {
  availability_zone       = "us-west-2b"
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = var.pub_sub2block
  map_public_ip_on_launch = true

  tags = {
    Name = var.tagpubsub2
  }
}

resource "aws_subnet" "private_sub1" {
  availability_zone = "us-west-2a"
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = var.pri_sub1block

  tags = {
    Name = var.tagprisub1
  }
}

resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = var.tagigw
  }

}

resource "aws_default_route_table" "terra_rt1" {
  default_route_table_id = aws_vpc.terra_vpc.default_route_table_id

  route {
    cidr_block = var.route_block
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = var.tagrt1
  }
}

resource "aws_route_table_association" "routeassociate_1" {
  route_table_id = aws_default_route_table.terra_rt1.id
  subnet_id      = aws_subnet.public_sub1.id

}

resource "aws_route_table_association" "routeassociate_2" {
  route_table_id = aws_default_route_table.terra_rt1.id
  subnet_id      = aws_subnet.public_sub2.id

}

#Below is the custom created table.
/*
resource "aws_route_table_association" "routeassociate_2" {
    route_table_id = aws_route_table.terra_rt1.id
    subnet_id = aws_subnet.public_sub2.id

}*/

