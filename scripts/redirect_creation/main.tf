
terraform {
  backend "remote" {
    organization = "liquibase"
    workspaces {
      name = "liquibase-docs"
    }
  }
}

# use Terraform Remote State Data stanza to read state from staging workspace
data "terraform_remote_state" "staging" {
  backend = "remote"
  config = {
    organization = "liquibase"
    workspaces = {
      name = "liquibase-staging"
    }
  }
}
# use Terraform Remote State Data stanza to read state from prod workspace
data "terraform_remote_state" "prod" {
  backend = "remote"
  config = {
    organization = "liquibase"
    workspaces = {
      name = "liquibase-prod"
    }
  }
}
# Need legacy Datical account since s3 buckets for docs are there
provider "aws" {
  alias      = "datical"
}

# 0 byte objects used for redirects
resource "aws_s3_object" "redirects" {
  count            = length(keys(var.redirects))
  bucket           = "data.terraform_remote_state.${var.env}.outputs.docs_origin_bucket"
  key              = element(keys(var.redirects), count.index)
  content_type     = "text/html"
  website_redirect = element(values(var.redirects), count.index)
}


