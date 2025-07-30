resource "aws_instance" "terraform_web" {
  ami                         = "ami-08ca1d1e465fbfe0c" #"ami-090474ba55eca2573"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub_sub.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, {
    Name = "06-Resource EC2"
  })
    lifecycle {
      create_before_destroy = true
    }
}

resource "aws_security_group" "public_http_traffic" {
  description = "allows traffic on 443 and 80"
  name        = "public_http_traffic"
  vpc_id      = aws_vpc.main.id
  tags = merge(local.common_tags, {
    Name = "06-Resource SG"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}