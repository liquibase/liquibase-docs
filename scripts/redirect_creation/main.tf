

# 0 byte objects used for redirects
resource "aws_s3_bucket_object" "redirects" {
  count            = length(keys(var.redirects))
  bucket           = var.stage == "prod" ? "prod-docsliquibasecom-origin" : "stage-docsstageliquibasecom-origin"
  key              = element(keys(var.redirects), count.index)
  content_type     = "text/html"
  website_redirect = element(values(var.redirects), count.index)
}


