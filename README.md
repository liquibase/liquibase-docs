# docs.liquibase.com

Documentation for the liquibase website.

The files in the `scripts\redirect_creation` directory comprise the terraform configuration called by our GitHub Actions workflows for the publishing of 301 redirects to documentation websites, both staging and production.

The publishing of site redirects is part of the overall content publishing workflow used by the Liquibase Documentation Team.

***Please send us pull requests if you see something that needs to be updated!***

How to make docs changes
====================================================================

This workflow is as follows:

1. Documentation team members publish updated content to a staging site directly from their content management system (Flare).
2. They then create a Pull Request (PR) from a new branch to the `master` branch or sometimes make commits directly to `master` branch that adds or updates 301 redirects in the `repo/scripts/redirect_creation/variables.tf` file.
3. The creation of the PR runs `send-docs-redirects-to-staging.yml` first and then after it's completion runs `send-enterprise-redirects-to-staging.yml`, which automatically runs the Terraform plan and outputs changes to be applied in the `s3://stage-docsstageliquibasecom-origin` and `s3://stage-enterprisestagedocsliquibasecom-origin` respectively to their stagging bucket.
4. The Docs team merges the PR into master or changes directly made to master : runs `send-docs-redirects-to-staging.yml` and then runs `send-enterprise-redirects-to-staging.yml` which automatically stages redirect changes to `s3://stage-docsstageliquibasecom-origin` and `s3://stage-enterprisestagedocsliquibasecom-origin` respectively (in `liquibase-admin`) for preview.
5. The Docs team then previews/verifies both content and redirects on the staging site.
6. At this point the public documentation website for Liquibase should be fully up to date.

Thank you for your submission!

