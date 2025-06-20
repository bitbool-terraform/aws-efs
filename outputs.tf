output "efs_dns_name" {
  value = aws_efs_file_system.aws_efs.dns_name
}

output "efs_arn" {
  value = aws_efs_file_system.aws_efs.arn
}

output "efs_app_arn" {
  value = aws_efs_access_point.efs_app.arn
}

