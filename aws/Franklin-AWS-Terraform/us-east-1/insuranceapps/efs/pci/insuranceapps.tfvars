efs_name = "EFS-Insurance-Apps"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10112021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "08212023"
	"Name" = "EFS-Insurance-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/dcdfc675-7ed4-48df-a063-6b8c5cc4eff2"
subnet_id = "subnet-0a33ed77fe2cfb6ef"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0a797df6e7dcae3db"

efs_security_group_name = "Efs_iapps_access_group"
vpc_id = "vpc-00bd4d2758879b1e0"
// sg_ingress_rules = {
 // "1" = {
  // from_port   = 2049
  // to_port     = 2049
  // protocol    = "tcp"
  // cidr_blocks = ["10.153.2.0/23"]
  // description = "NFS From Private Subnets Prod"
 // }
// }
efs_sg_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10112021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "08242023"
	"Name" = "Efs_iapps_access_group"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}