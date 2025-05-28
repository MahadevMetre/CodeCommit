Infra setup for Production Digital Marketing Serverless(PCI Account)

acm-- embedded.fmservice.com and its associated route53
secrets manager --- marketing-vanity-secrets-pci
dynamodb -- fmg-app-clients-pci
security group-- digital-docker-lambda-sg
lambda--
1. validate_token --role mapped to digital-lambda-docker-role-pci
2. marketing-default-delivery-pci --role-digital-lambda-docker-role-pci
3. marketing-coverage-details-pci --role-digital-lambda-docker-role-pci
4. marketing-matchbackenroll-pci --role-digital-lambda-docker-role-pci
5. marketing-coverage-upsell-pci --role-digital-lambda-docker-role-pci
6. marketing-validate-accesscode-pci --role-digital-lambda-docker-role-pci
7. marketing-manage-spokenkey-pci --role-digital-lambda-docker-role-pci
8. marketing-enroll-pci --role-digital-lambda-docker-role-pci
9. marketing-manage-eventspokenkeys-pci --role-digital-lambda-docker-role-pci
10. fmg-app-function-pci --role can be mapped to marketing-vanity-lambda-role-pci
11. marketing-lambda-warm-pci--role-digital-lambda-docker-role-pci, Jenkins job for build,promotion--marketing_lambda_warm_branch and
 event bridge scheduler mapped to above-- Embedded-APIs-WarmUp

kms-- fmg-marketing-jwt --role can be mapped to marketing-vanity-lambda-role-pci

iam roles-- marketing-vanity-lambda-role-pci(iam policies- 4 policies to be added from terraform)
            digital-lambda-docker-role-pci(iam policies-- 5 policies which are already there in pci)

apigatway --fmg-marketing-lambda-pci and custom domain is acm value, create authorizer(oauth2) manually


