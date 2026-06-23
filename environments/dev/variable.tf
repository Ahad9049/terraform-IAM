variable "iam_user_name" {
  description = "The name of the IAM user to create"
  type        = string
}
variable "iam_group_name" {
  type        = string
  description = "The name of the IAM group to create"
}
variable "iam_role_name" {
  type        = string
  description = "The name of the IAM role to create"
}
variable "iam_policies" {
  description = "A list of IAM policies to attach"
  type        = list(string)

}
variable "ec2_profile_name" {
  description = "The name of the EC2 instance profile to create"
  type        = string
}

