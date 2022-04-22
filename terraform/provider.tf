provider "aws" {
  profile = var.iam_tf_user
  region  = var.default_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}