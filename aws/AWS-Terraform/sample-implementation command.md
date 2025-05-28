Lambda:

terraform init
terraform plan -var-file fmg_pci_processS3ArchiveEvent_lambda.tfvars
terraform apply -var-file fmg_pci_processS3ArchiveEvent_lambda.tfvars

***************************************************************************************************
***************************************************************************************************
SNS

config path- processS3ArchiveEvent_error_sns_pci

terraform init 
terraform plan -var-file fmg_pci_archive_sns.tfvars
terraform apply -var-file fmg_pci_archive_sns.tfvars

-------------------------------------------------------------------------------------------------
config path- processS3ArchiveEvent_sns_pci

terraform init
terraform plan -var-file fmg_pci_archive_error_sns.tfvars
terraform apply -var-file fmg_pci_archive_error_sns.tfvars


***************************************************************************************************
***************************************************************************************************
S3

config path- captiva_landingzone_pci

terraform init
terraform plan -var-file fmg_pci_captiva_LZ.tfvars
terraform apply -var-file fmg_pci_captiva_LZ.tfvars
-------------------------------------------------------------------------------------------------
config path- insuranceclaimscabinet_pci

terraform init
terraform plan -var-file fmg_pci_ins_claims.tfvars
terraform apply -var-file fmg_pci_ins_claims.tfvars
-------------------------------------------------------------------------------------------------
config path- insurancehistoriccabinet_pci

terraform init
terraform plan -var-file fmg_pci_ins_historic.tfvars
terraform apply -var-file fmg_pci_ins_historic.tfvars
---------------------------------------------------------------------------------------------------
config path- insurancenontermcabinet_pci

terraform init
terraform plan -var-file fmg_pci_ins_non_term.tfvars
terraform apply -var-file fmg_pci_ins_non_term.tfvars
-------------------------------------------------------------------------------------------------
config path- insurancetermcabinet_pci

terraform init
terraform plan -var-file fmg_pci_ins_term.tfvars
terraform apply -var-file fmg_pci_ins_term.tfvars

***************************************************************************************************
***************************************************************************************************
SQS

config path- captiva_incoming_error_queue_pci

terraform init
terraform plan -var-file fmg_pci_captiva_incoming_error.tfvars
terraform apply -var-file fmg_pci_captiva_incoming_error.tfvars
---------------------------------------------------------------------------------------------------
config path- captiva_incoming_pci

terraform init
terraform plan -var-file fmg_pci_captiva_incoming.tfvars
terraform apply -var-file fmg_pci_captiva_incoming.tfvars
---------------------------------------------------------------------------------------------------
config path- s3_event_archive_incoming_error_queue_pci

terraform init
terraform plan -var-file fmg_pci_s3_event_archive_incoming_error.tfvars
terraform apply -var-file fmg_pci_s3_event_archive_incoming_error.tfvars
---------------------------------------------------------------------------------------------------
config path- s3_event_archive_incoming_pci

terraform init
terraform plan -var-file fmg_pci_s3_event_archive_incoming.tfvars
terraform apply -var-file fmg_pci_s3_event_archive_incoming.tfvars
---------------------------------------------------------------------------------------------------
config path- s3_event_restore_incoming_error_queue_pci

terraform init
terraform plan -var-file fmg_pci_s3_event_restore_incoming_error.tfvars
terraform apply -var-file fmg_pci_s3_event_restore_incoming_error.tfvars
---------------------------------------------------------------------------------------------------
config path- s3_event_restore_incoming_pci

terraform init
terraform plan -var-file fmg_pci_s3_event_restore_incoming.tfvars
terraform apply -var-file fmg_pci_s3_event_restore_incoming.tfvars
---------------------------------------------------------------------------------------------------