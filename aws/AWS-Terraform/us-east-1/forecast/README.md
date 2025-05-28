Infra setup for Production Athena-forecast (Serverless)

1. IAM Role - forecast-ecs-task-execution-role including 4 policies - Terraform
2. Application Load balancer(including one security group)  - Terraform
   Target Group - Terraform
3. ECS Cluster - Terraform
4. ACM/Route53  - Terraform
5. Secrets manager - Terraform
6. ECR Repo - fmg-forecast - Terraform
7. s3 Bucket and Cloudfront-UI -Hosting--Terraform


Note: Dev and QA and Stage AWS setup was completely Terraform code.

