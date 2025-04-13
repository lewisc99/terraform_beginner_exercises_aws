output "s3_bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = module.s3_bucket.bucket_id
}
