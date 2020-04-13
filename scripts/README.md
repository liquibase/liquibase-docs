# docs.liquibase.org / docs-staging.liquibase.org

This repository contains the source for the docs.liquibase.org website.  The website is hosted on an AWS S3 bucket.  Once the content is built with MadCap Flare, the generated content will need to be uploaded to the S3 bucket using the AWS S3 CLI.

## Prerequisites to update the documentation on the AWS S3 bucket using the CLI

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

[AWS Access Key and Secret Key](https://console.aws.amazon.com/iam/home?region=us-east-1#/security_credentials)

### Prerequsite Installation

1. Windows Users - Install via the MSI here: (<https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html#install-msi-on-windows)>
OR
1. Install AWS CLI using the link in the prerequisites.  Examples using package managers:

```bash
(Mac) brew install awscli
(RHEL/Centos) yum install awscli
(Ubuntu) apt-get install awscli
(Python) pip3 install awscli
(Windows) choco install awscli
```

2. Configure AWS CLI using your assigned Access Key and Secret Key.  If you need these see Jake or Steve.

```bash
aws configure
AWS Access Key ID [None]: <accessKey>
AWS Secret Access Key [None]: <secretKey>
Default region name [None]: us-east-1
Default output format [None]: json
```

## CLI Usage - run from cmd prompt

### Upload to S3
Upload the current working folder to the destination bucket:

`aws s3 sync . s3://docs.liquibase.org`

Upload the specified folder to the destination bucket:

`aws s3 sync <folder> s3://docs.liquibase.org`

Sync the specified folder to the destination bucket and delete any files on the destination that do not exist on the source:

`aws s3 sync <folder> s3://docs.liquibase.org --delete`
