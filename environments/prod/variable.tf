variable "iam_user_name" {
  description = "The name of the IAM user to create"
  type        = string

}
variable "iam_group_name" {
  description = "The name of the IAM group to create"
  type        = string
}
variable "iam_role_name" {
  description = "The name of the IAM role to create"
  type        = string
}
variable "iam_policies" {
  description = "A list of IAM policies to attach"
  type        = list(string)
}
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}
variable "instance_profile_name" {
  description = "The name of the EC2 instance profile to create"
  type        = string
}