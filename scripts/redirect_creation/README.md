
The files in this directory comprise the terraform configuration called by our GitHub Actions workflows for the publishing of 301 redirects to documentation websites, both staging and production.

The publishing of site redirects is part of the overall content publishing workflow used by the Liquibase Documentation Team.

This workflow is as follows:

1. Documentation team members publish updated content to a staging site directly from their content management system (Flare). 
2. Team members then add or update any 301 redirects by editing the file `variables.tf` within this directory.
3. By manually triggering the `send-redirects-to-staging.yml` action the updated redirects are published to the staging site for preview.  
4. When the documentation content and redirects look correct on the preview site then the new content can also be sent from Flare to the production site.
5. The 301 redirects are released to production via pull-request (PR) in this repo. PR approval triggers the `send-redirects-to-production.yml` action.
6. At this point the public documentation website for Liquibase should be fully up to date.


