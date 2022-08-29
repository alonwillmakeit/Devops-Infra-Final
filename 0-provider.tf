terraform {
  backend "s3" {
    bucket  = "alon-devops-bucket"
    key     = "alon/terraform-eks-provision.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.27.0"
    }
  }
}
