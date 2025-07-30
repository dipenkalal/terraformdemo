locals {
  common_tags = {
    Name       = "NCPL"
    ManagedBy  = "Terraform"
    Project    = "Resources6"
    CostCenter = "1234"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = merge(local.common_tags, {
    Name = "06-Resource VPC"
  })
}

resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = merge(local.common_tags, {
    Name = "06-Resource Subnet"
  })

}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "06-Resource IGM"
  })

}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "06-Resource Route Table"
  })
}

resource "aws_route" "default_route_to_igw" {
  route_table_id         = aws_route_table.pub_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_rt.id
}