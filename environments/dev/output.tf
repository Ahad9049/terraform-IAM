output "iam_user_name" {
  value = module.iam.iam_user_name
  
}
output "iam_group_name" {
  value = module.iam.iam_group_name
}
output "iam_role_name" {
  value = module.iam.iam_role_name
}
output "aws_iam_instance_profile_name" {
  value = module.iam.aws_iam_instance_profile_name
}

output "access_key_id" {
  value = module.iam.access_key_id
  sensitive = true
}
output "secret_access_key" {
  value = module.iam.secret_access_key
  sensitive = true
}