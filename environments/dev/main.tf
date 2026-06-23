module "iam" {
  source       = "../../module/iam"
  user_name    = var.iam_user_name
  group_name   = var.iam_group_name
  role_name    = var.iam_role_name
  iam_policies = var.iam_policies
}
