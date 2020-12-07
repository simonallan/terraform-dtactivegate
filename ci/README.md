# CI Pipeline Deployment Steps

The procedure for an end-to-end deployment on AWS starts with the creation of a Continuous Integration pipeline. The following steps show how to launch the DTActivegate CI pipeline into a fresh environment.

## Prerequisites

* AWS account with deployment role configured (currently using a dev role, this will be de-coupled by assuming a role to run the deployment. This deployment role can later be re-coupled to a specific automation role).

* A linux-style command-line with AWS CLI installed. If you use stored credentials please make sure your `~/.aws/config` has blank settings in the Default profile as these will be overwritten by the Docker CLI authenticator.

* If using the dockerised authentication method you'll need a working Docker installation. For ASUS-laptops this is typically an integration with [Docker Desktop for Windows and the WSL2 backend](https://docs.docker.com/docker-for-windows/wsl/) whereas iOS users may set this up [in the usual way](https://docs.docker.com/docker-for-mac/install/).

* Github personal access token with [no scope defined](https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/) and securely stored. This is to be supplied when launching the `ci-pipeline-deploy` script.

## Step 1. Prepare an AWS account

Launching the Cloudformation stack requires two roles; the first is a developer role which authenticates to Azure and has permissions to assume the pipeline deployment role. This second role is used for the pipeline creation has policies that limit access to resources needed for execution. (Note: this is to be added with the next feature branch, at this point please use your developer role).

## Step 2. Prepare the CI deployment environment

Repeatable launching of the CI pipeline has been set up by using a bash script to trigger the launch of a Cloudformation stack. This script sets the stack name and environment values for the target account and calls `create-stack` to launch a new stack, passing it parameters from an environment-specific json file located in `…/ci/environments/<ENVIRONMENT>/dtactivegate-ci-params.json`.

Parameter           | Description
--------------------|--------------------
`GitHubOAuthToken`  | Reads from STDIN when launching the script and does not live in source control
`OutputBucketName`  | (Optional) The name of the S3 bucket where the zip file output from Github should be placed. This S3 bucket is the location that will be used as a source for integrations. The full key is in the format `output-bucket-name/git-user/git-repository/git-user_git-repository.zip`
`QSS3BucketRegion`  | Region in which to place the CI pipeline files and assets
`QSS3KeyPrefix`     | The S3 key name prefix used to simulate a folder for CI pipeline assets
`VPCId`             | ID of the deployment VPC in target account
`VPCCidrRange`      | CIDR range of target VPC (Default is configured to AWS default VPC specs)
`SubnetIds`         | Subnet IDs to allow Lambdas to initialise

## Step 3. Launch the CI-Pipeline stack

Launch the AWS pipeline template into your AWS account by specifying parameter values and creating the stack.

* Authenticate with AzureIDP and obtain temporary credentials. At this stage I am using the Docker method for [obtaining CLI session keys](https://github.com/CRUKorg/curly-octo-lamp/blob/master/dev/README.md#managing-api-keys-for-the-cli) hosted at `/CRUKorg/curly-octo-lamp`.

At the command line run:

```Shell
docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login

# Docker image should download, and you should see Profile 'default' is not configured properly

docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login --configure

# Configures various values in ~/.aws/config for your [default] profile

docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login sh

# Should give you a list of accounts and roles to pick from, prompt for a password and MFA
```

A Docker image should download and execute. When prompted enter your AD user name (normally defaults to this) and password. Choose the account and session duration and authenticate.

***Note:** The region set in `aws-config`'s default profile is preserved and becomes the new region. Double-check that the region is set correctly in `~/.aws/config` and reset manually if needed.*

* Verify authentication is successful and the correct role has been assumed with `aws sts get-caller-identity`. If successfully authenticated this will return your current credentials.

* CD to the root of the `ci` directory and run the ci-pipeline-deploy script, supplying your Github personal access token.

```Shell

```

On successful initialisation the stack ARN will be output to the command line. Use this to locate your stack in the AWS [CloudFormation console](https://eu-west-2.console.aws.amazon.com/cloudformation/home?region=eu-west-2#/stacks?filteringText=&filteringStatus=active&viewNested=true&hideStacks=false)
