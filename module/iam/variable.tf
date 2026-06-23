variable "user_name" {
  description = "The name of the IAM user to create"
  type        = string
  default     = "ahad-tf"
}

variable "group_name" {
  description = "The name of the IAM group to create"
  type        = string
  default     = "devops-group"
}

variable "role_name" {
  description = "The name of the IAM role to create"
  type        = string
  default     = "EC2-role"
}
variable "iam_policies" {
  description = "A list of IAM policies to attach"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
}
