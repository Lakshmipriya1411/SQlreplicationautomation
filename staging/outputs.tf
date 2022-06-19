output "staging_website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.staging.website_endpoint}/index.html"
}

