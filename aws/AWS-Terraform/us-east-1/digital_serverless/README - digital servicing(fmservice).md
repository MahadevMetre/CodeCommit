Infra setup for Production Digital Serverless(Self Service)

1. IAM Role - digital-ecs-task-execution-role including 4 policies - Terraform
   Policy - Amazon_EventBridge_Invoke_Api_Destination - Manual
   Policy - Parameter store policy-Manual
2. Network Load balancer(including one security group) - fmg-digital-nlb-serverless - Terraform
   Target Group - fmg-digital-serverless - Terraform
3. ECS Cluster - digital-services - Terraform
autoscaling group is manually added with desired tasks from 0 to 1. 

4. Repliate All API Gateway End Points (Cognito Need Permission) -Manual 
   API 
   API Endpoint URL 
5. SQS Queues  (Security Account permission)  - Terraform
	(1. digital_customer_profile_error_queue_dev.fifo
	 2. digital_customer_profile_incoming_queue_dev.fifo
	 3. digital_customer_service_error_queue_dev.fifo
	 4. digital_customer_service_incoming_queue_dev.fifo)
	 5. 1 Dead letter queue is created in pci account for eventbridge rule --Only this is Manual as part of Event bridge rule.  
6. Event Bridge Pipes - digital-customer-profile-queue-stage - Manual
                      - digital-customer-service-queue-stage - Manual
						  
   Event Bridge Rules - digital-post-confirmation-queue-scheduler-stage - Manual
                      
   API destinations - digital-post-confirmation-queue-api-stage - Manual
                      
7. KMS and Param Store - Terraform
8. Secret Manager-for Secret manager please refer JBOSS Stage secret Values and need to update accordingly
both Digital Secrets and Marketing Secrets - Terraform
9. ECR Repo - fmg-insuranceapps - Terraform
10. Cognito lambda triggers - selfservice-custom-trigger-stage (nodejs code update) - Terraform
	                        - selfservice-pre-signup-stage (nodejs code update) - Terraform
							- selfservice-post-confirmation-stage - Terraform
11. ACM/Route53 - stage-digital-services-mt.fmservice.com - Terraform
12. 
AWS Batch Jobs:( pci keep config 2vCpu and 4GB memory) - Terraform
-------------------------------
digital-account-update-notification-job
digital-customer-profile-delete-job
marketing-discard-paperleess-job
marketing-mbenroll-job
marketing-mbenroll-failure-job
 
AWS Event Bridge Schedulers :  - Terraform
-------------------------------
digital-account-update-notification-job	
digital-customer-profile-delete-job
marketing-discard-paperleess-job
marketing-mbenroll-job
marketing-mbenroll-failure-job

13. VPC Link in API gateway--Manual




Note: Dev and Stage AWS setup was completely Manual. No Terraform code.
