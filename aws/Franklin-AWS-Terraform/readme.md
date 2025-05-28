##############################################3
## Author : Pavan Venkata Charan, Veerla
## Email  : pcharan@franklin-madison.com
## Role   : AWS Developer
## Description : Deploying the AWS resorces using terraform in dev, stage ad production env.
## Initial Deployment of code into Production : April 1st 2020
## Modified to capture few more info 01/28 
#####

## For assuming role in another account use the following command
######

aws sts assume-role --role-arn ASSUMING-ROLE-ARN --role-session SESSION-NAME --serial-number arn:aws:iam::894891841990:mfa/username --token-code 6-DIGIT-MFA

##
##### The following will be response to the above command
#####
{
    "Credentials": {
        "AccessKeyId": "",
        "SecretAccessKey": "",
        "SessionToken": "",
        "Expiration": "2020-03-25T21:30:29Z"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "",
        "Arn": ""
    }
}

#####
## SET the above response as env variables 
#####
#Windows
####
SET AWS_ACCESS_KEY_ID=AccessKeyId
SET AWS_SECRET_ACCESS_KEY=SecretAccessKey
SET AWS_SESSION_TOKEN="SessionToken"
#Linux
export AWS_ACCESS_KEY_ID=AccessKeyId
export AWS_SECRET_ACCESS_KEY=SecretAccessKey
export AWS_SESSION_TOKEN="SessionToken"


###
## Verify the assumed role info
###
aws sts get-caller-identity
###
#Output of this should have the same values as per output of earlier command
###

############################################
### Terrafor Commands
###########################################

terraform init
terraform plan -var-file <fiename.tfvars> -input=false
terraform apply -var-file <filename.tfvars> 

terraform destroy -var-file <filename.tfvars>

####################################################
Terraform create job

Terraform destroy Job
####################################################