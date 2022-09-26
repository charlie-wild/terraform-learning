output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.test_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.test_server.public_ip
}

output "bucket_name" {
  description = "state bucket name"
  value       = aws_s3_bucket.terraform_state.bucket_domain_name
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
