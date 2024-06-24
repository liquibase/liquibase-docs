# docs.liquibase.com

Documentation for the liquibase website.

The files in the `scripts\redirect_creation` directory comprise the Terraform configuration called by our GitHub Actions workflows for the publishing of 301 redirects to documentation websites, both staging and production.

The publishing of site redirects is part of the overall content publishing workflow used by the Liquibase Documentation Team.

***Please send us pull requests if you see something that needs to be updated!***

How to make docs changes
====================================================================

Please see [CONTRIBUTING.md](https://github.com/liquibase/liquibase-docs/blob/master/CONTRIBUTING.md) for guidance on how to submit a GitHub PR.

**When you submit your PR, please assign it to @adrian-velonis1 for review.**

We welcome any and all pull requests. Documentation pages are written in HTML/XML. However, you may see some unfamiliar markup. For example:

* Traditional HTML `a href` hyperlinks are present alongside `MadCap:xref` "cross-references." Use an `xref` if you want to display the exact title of the page being linked to. Use an `href` if you want the link to display different text than the page title. Please use relative paths in all links to Liquibase documentation pages.
* Some content you may want to edit is within a `.flsnp` ("MadCap Flare snippet") file. This is a mechanism to single-source content in order to allow reuse but minimize duplication. You can edit snippet files, but please be mindful that content in them may appear in several distinct contexts. Please search the repository for uses of the snippet (`MadCap:snippetBlock src="filename.html"` and `MadCap:snippetText src="filename.html"`) to verify that your change fits into the surrounding text!
* Some content is marked up with tags like `MadCap:conditions` and `MadCap:snippetVariables`. These tags help us generate dynamic and context-specific content in otherwise static, reusable snippets. You can edit content that is tagged with a condition or variable, but please be mindful of context.

If you're editing content in snippets, conditions, or variables, we might take longer to review your PR. Alternatively, we may close your PR and make your intended change through MadCap Flare.

Internal documentation team process
====================================================================

1. Liquibase Documentation Team members publish updated content to a staging site directly from their content management system (MadCap Flare).
2. They then create a Pull Request (PR) from a new branch to the `master` branch or sometimes make commits directly to `master` branch that adds or updates 301 redirects in the `/scripts/redirect_creation/variables.tf` file.
3. The creation of the PR runs `send-docs-redirects-to-staging.yml` first and then after its completion runs `send-enterprise-redirects-to-staging.yml`, which automatically runs the Terraform plan and outputs changes to be applied in the `s3://stage-docsstageliquibasecom-origin` and `s3://stage-enterprisestagedocsliquibasecom-origin` respectively to their stagging bucket.
4. The Docs team merges the PR into master or changes directly made to master : runs `send-docs-redirects-to-staging.yml` and then runs `send-enterprise-redirects-to-staging.yml` which automatically stages redirect changes to `s3://stage-docsstageliquibasecom-origin` and `s3://stage-enterprisestagedocsliquibasecom-origin` respectively (in `liquibase-admin`) for preview.
5. The Docs team then previews/verifies both content and redirects on the staging site.
6. At this point the public documentation website for Liquibase should be fully up to date.

Thank you for your submission!

