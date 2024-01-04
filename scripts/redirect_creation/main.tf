
terraform {
  backend "remote" {}
}

# use Terraform Remote State Data stanza to read state from environment-based workspace
data "terraform_remote_state" "state" {
  backend = "remote"
  config = {
    hostname     = "spacelift.io"
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
  for_each = {
    for redirect in var.redirects : redirect.key => redirect
  }
  bucket           = data.terraform_remote_state.state.outputs.docs_origin_bucket
  key              = each.value.key
  content_type     = "text/html"
  website_redirect = each.value.website_redirect
}

resource "aws_s3_object" "enterprise_redirects" {
  for_each = {
    for enterprise_redirect in var.enterprise_redirects : enterprise_redirect.key => enterprise_redirect
  }
  bucket           = data.terraform_remote_state.state.outputs.docs_origin_bucket
  key              = each.value.key
  content_type     = "text/html"
  website_redirect = each.value.website_redirect
}
