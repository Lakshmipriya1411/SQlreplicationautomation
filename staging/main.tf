terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_pet" "petname" {
  length    = 4
  separator = "-"
}

resource "aws_s3_bucket" "staging" {
  bucket = "${var.staging_prefix}-${random_pet.petname.id}"

  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "staging" {
  bucket = aws_s3_bucket.staging.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "staging" {
  bucket = aws_s3_bucket.staging.id

  acl = "public-read"
}

resource "aws_s3_bucket_policy" "staging" {
  bucket = aws_s3_bucket.staging.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.staging.id}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_s3_object" "staging" {
  acl          = "public-read"
  key          = "index.html"
  bucket       = aws_s3_bucket.staging.id
  content      = file("${path.module}/../assets/index.html")
  content_type = "text/html"
}


