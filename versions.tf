terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38"
    }
  }
}

provider "aws" {
    region = "us-east-2"
    access_key = ${AWS_ACCESS_KEY_ID}
    secret_key = ${AWS_SECRET_ACCESS_KEY}
}