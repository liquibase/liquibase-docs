# docs.liquibase.com

Documentation for the liquibase website.

The files in the `scripts\redirect_creation` directory comprise the terraform configuration called by our GitHub Actions workflows for the publishing of 301 redirects to documentation websites, both staging and production.

The publishing of site redirects is part of the overall content publishing workflow used by the Liquibase Documentation Team.

***Please send us pull requests if you see something that needs to be updated!***

How to make docs changes
====================================================================

This workflow is as follows:

1. Documentation team members publish updated content to a staging site directly from their content management system (Flare).
2. They then create a Pull Request (PR) from a new branch to the `master` branch that adds or updates 301 redirects in the `repo/scripts/redirect_creation/variables.tf` file.
3. The creation of the PR runs `send-redirects-to-staging.yml` which automatically runs the Terraform plan and outputs changes to be applied in the `s3://stage-docsstageliquibasecom-origin` stagging bucket.
4. The Docs team merges the PR into master and this action runs `send-redirects-to-staging.yml` which automatically stages redirect changes to `s3://stage-docsstageliquibasecom-origin` (in `liquibase-admin`) for preview.
5. The Docs team then previews/verifies both content and redirects on the staging site.
<!-- 6. Finally, the 301 redirects can be released to production by running `send-redirects-to-production.yml` action via manual trigger. This workflow will copy the website content from `s3://stage-docsstageliquibasecom-origin` to `s3://prod-docsliquibasecom-origin` (in `liquibase-admin`) and apply content redirections. -->
7. At this point the public documentation website for Liquibase should be fully up to date.

Thank you for your submission!
