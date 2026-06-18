provider "aws" {
  region = "us-east-1"
}
# IAM User Creation
resource "aws_iam_user" "user" {
  name = "ahad-tf"

}
#IAM group creation
resource "aws_iam_group" "group" {
  name = "devops-group"

}
# ADD user to group
resource "aws_iam_user_group_membership" "membership" {
  user   = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
}
# Attach policy to group
resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ])
  group      = aws_iam_group.group.name
  policy_arn = each.value
}
#IAM ROle Creation
resource "aws_iam_role" "Ec2-role" {
  name = "EC2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

}
# Attach policy to role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ])
  role       = aws_iam_role.Ec2-role.name
  policy_arn = each.value
}
