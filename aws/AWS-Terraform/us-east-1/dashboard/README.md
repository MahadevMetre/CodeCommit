Infra setup for Production Athena-Dashboard (Serverless)

1. IAM Role - dashboard-ecs-task-execution-role including 4 policies - Terraform
   IAM User- Dashboard-rds-user and its policy- Terraform
2. Application Load balancer(including one security group)  - Terraform
   Target Group - Terraform
3. ECS Cluster - Terraform
4. ACM/Route53  - Terraform
5. KMS for RDS - Terraform
6. RDS and proxy - Terraform
7. ECR Repo - fmg-insuranceapps  - Terraform, note: for dev, stage, it is deployed on fmg-insuranceapps repo
8. s3 Bucket and Cloudfront-UI -Hosting--Terraform


Note: Dev and QA and Stage AWS setup was completely Terraform code.

