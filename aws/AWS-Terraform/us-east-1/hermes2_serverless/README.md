Infra setup for Production Hermes2(Prod-Account)

1. ACM/Route 53 -- Terraform
2. Batch -- Terraform
3. Application Load balancer(including one security group) -- Terraform
   Target Group -- Terraform
4. EFS mounted EC2 server and security group -- Terraform
5. Secret Manager-for Secret manager please refer JBOSS Stage secret Values and need to update accordingly - Terraform
6. ECR Repo - fmg-insuranceapps - Terraform
7. ECS -- Terraform
8. Event_bridge -- Terraform
9. Lambda -- Terraform
10. IAM Role -- Terraform
11. KMS -- Terraform
12. RDS Instance --Manual  
    with proxy  -- Terraform
13. S3 With Cloudfront -- Terraform
14. S3 Buckets - Terraform
15. SES Config set -- Terraform
16. SQS Queues  (Security Account permission)  - Terraform
	



