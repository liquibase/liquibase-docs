
terraform {
  backend "remote" {
    organization = "liquibase"
    workspaces {
      name = "liquibase-docs"
    }
  }
}

# use Terraform Remote State Data stanza to read state from prod and staging workspaces

data "terraform_remote_state" "prod" {
  backend = "remote"

  config = {
    organization = "liquibase"
    workspaces = {
      name = "liquibase-prod"
    }
  }
}

data "terraform_remote_state" "staging" {
  backend = "remote"

  config = {
    organization = "liquibase"
    workspaces = {
      name = "liquibase-staging"
    }
  }
}

# Need legacy Datical account since s3 buckets for docs are there
provider "aws" {
  region     = "us-east-1"
}

# 0 byte objects used for redirects
resource "aws_s3_object" "redirects" {
  count            = length(keys(var.redirects))
  bucket           = var.stage == "prod" ? data.terraform_remote_state.prod.outputs.docs_origin_bucket : data.terraform_remote_state.staging.outputs.docs_origin_bucket
  key              = element(keys(var.redirects), count.index)
  content_type     = "text/html"
  website_redirect = element(values(var.redirects), count.index)
}


