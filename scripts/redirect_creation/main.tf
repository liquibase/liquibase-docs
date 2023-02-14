
terraform {
  backend "remote" {}
}

# use Terraform Remote State Data stanza to read state from environment-based workspace
data "terraform_remote_state" "state" {
  backend = "remote"
  config = {
    organization = "liquibase"
    workspaces = {
      name = "liquibase-${var.env}"
    }
  }
}

# Need legacy Datical account since s3 buckets for docs are there
provider "aws" {
  alias = "datical"
}

# 0 byte objects used for redirects
resource "aws_s3_object" "redirects" {
  count            = length(keys(var.redirects))
  bucket           = data.terraform_remote_state.state.outputs.docs_origin_bucket
  key              = element(keys(var.redirects), count.index)
  content_type     = "text/html"
  website_redirect = element(values(var.redirects), count.index)
}


