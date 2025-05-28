Infra setup for Production Atlas WebServices (Serverless)

1. IAM Role - atlas-ecs-task-execution-role including 5 policies - Terraform
   Policy - Parameter store policy-Terraform
             SES Access policy- Terraform/Manual(lower environments)
2. Application Load balancer(including one security group)  - Terraform
   Target Group - Terraform
3. ECS Cluster - Terraform
4. ACM/Route53  - Terraform
5. KMS and Param Store - Terraform
6. Secret Manager-for Secret manager please refer JBOSS Stage secret Values and need to update accordingly - Terraform


Note: QA and Stage AWS setup was completely Terraform code.
Only Dev is Manual.
