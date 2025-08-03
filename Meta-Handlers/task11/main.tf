terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "my_user" {
  name = "ustglobal"
}
resource "aws_iam_user_policy_attachment" "my_user_managed_policy" {
  user       = aws_iam_user.my_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
resource "aws_iam_user_policy" "my_user_inline_policy" {
  name   = "MyUserInlinePolicy"
  user   = aws_iam_user.my_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:ListBucket"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-bucket"
      },
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-bucket/*"
      }
    ]
  })
}
resource "aws_iam_policy" "my_policy" {
  name        = "MyPolicy"
  description = "This is my custom policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:ListBucket"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-bucket"
      },
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "arn:aws:s3:::my-bucket/*"
      }
    ]
  })
}
resource "aws_iam_role" "my_role" {
  name = "MyRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "my_role_managed_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  role       = aws_iam_role.my_role.name
}
resource "aws_iam_role_policy_attachment" "my_role_custom_policy" {
  policy_arn = aws_iam_policy.my_policy.arn
  role       = aws_iam_role.my_role.name
}
resource "aws_iam_role_policy" "my_role_inline_policy" {
  name = "MyRoleInlinePolicy"
  role = aws_iam_role.my_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:DescribeInstances"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = ["s3:ListAllMyBuckets"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
