
The files in this directory comprise the terraform configuration called by our GitHub Actions workflows for the publishing of 301 redirects to documentation websites, both staging and production.

The publishing of site redirects is part of the overall content publishing workflow used by the Liquibase Documentation Team.

This workflow is as follows:

1. Documentation team members publish updated content to a staging site directly from their content management system (Flare). 
2. They then create a Pull Request (PR) from a new branch that adds or updates 301 redirects in the `variables.tf` file within this directory.
3. To stage these redirect changes for preview they then manually trigger the `send-redirects-to-staging.yml` action, where they specify the branch containing their changes.
4. As soon as the documentation content and redirects **both** look correct on the preview site the new content can be sent from Flare to the production site also.
5. Finally the 301 redirects are released to production by approving and merging the PR. This triggers the `send-redirects-to-production.yml` action.
6. At this point the public documentation website for Liquibase should be fully up to date.
