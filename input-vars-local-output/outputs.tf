output "aws_s3_bucket" {
  value = aws_s3_bucket.project_bucket.bucket
  sensitive = true

} 

output "sensitive_var" {
    sensitive = true
  value = var.sensitive_value
}