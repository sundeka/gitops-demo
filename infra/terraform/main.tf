terraform {
  backend "s3" {
    bucket = "tuote-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}