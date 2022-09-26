terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "test_server" {
  ami                    = "ami-06672d07f62285d1d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0f4e8c19d3c61917a"]
  subnet_id              = "subnet-00342b198b2002f84"

  tags = {
    Name = var.instance_name
  }
}

terraform {
  backend "s3" {
    bucket = "charli-tf-state-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "eu-west-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
