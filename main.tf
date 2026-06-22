
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
resource "aws_iam_policy" "ec2_custom_policy" {
  name        = "EC2CustomPolicy"
  description = "Allow viewing, starting and stopping EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeTags",
          "ec2:DescribeVolumes"
        ]

        Resource = "*"
      },

      {
        Effect = "Allow"

        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]

        Resource = "*"
      }
    ]
  })
}
# Attach custom policy to group
resource "aws_iam_group_policy_attachment" "custom_group_policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.ec2_custom_policy.arn
}
# Attach policy to group
# resource "aws_iam_group_policy_attachment" #"group_policy_attachment" {
#   for_each = toset([
#     "arn:aws:iam::aws:policy/AmazonS3FullAccess",
#     "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
#   ])
#   group      = aws_iam_group.group.name
#   policy_arn = each.value
# }
# #IAM ROle Creation
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
# Attach custom policy to role
resource "aws_iam_role_policy_attachment" "custom_role_policy_attachment" {
  role       = aws_iam_role.Ec2-role.name
  policy_arn = aws_iam_policy.ec2_custom_policy.arn
}
# Attach policy to role
# resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
#   for_each = toset([
#     "arn:aws:iam::aws:policy/AmazonS3FullAccess",
#     "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
#   ])
#   role       = aws_iam_role.Ec2-role.name
#   policy_arn = each.value
# }
# create instance profile
resource "aws_iam_instance_profile" "instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.Ec2-role.name
}