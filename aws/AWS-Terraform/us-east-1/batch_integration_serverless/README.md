Infra setup for Production Batch-Integration (Serverless)

1. IAM Role - batch-integration-ecs-task-execution-role including 5 policies - Terraform
   Policy - SES policy--Manual in lower environment and Terraform in pci
2. Scheduled tasks in ECS Cluster-- Manual in lower environment and Terraform in pci
3. ECS Cluster - Terraform
4. Secret Manager-for Secret manager please refer JBOSS Stage secret Values and need to update accordingly - Terraform
5. ECR Repo--Only in PCI-Terraform. 

