terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-lewis"
    key = "lewisproject.tfstate"
    region = "us-east-2"
  }
}