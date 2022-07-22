# terraform {
#   # required_version = "~> 0.13"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }


provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "b" {
  source = "git::https://github.service.anz/terraform-modules/terraform-aws-s3.git?ref=v4.3.1"

  # bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Innovation"
  }

  versioning {
    enabled = true
  }
}

output "s3-bucket-1-bucket_name" {
  value = module.s3-bucket-1.bucket_name
}