output "iam_user_name" {
  value = aws_iam_user.user.name
}
output "iam_group_name" {
  value = aws_iam_group.group.name
}
output "aws_iam_instance_profile_name" {
  value = aws_iam_instance_profile.instance_profile.name
}
output "access_key_id" {
  value = aws_iam_access_key.access_key.id
  sensitive = true
}
output "secret_access_key" {
  value = aws_iam_access_key.access_key.secret
  sensitive = true
}
