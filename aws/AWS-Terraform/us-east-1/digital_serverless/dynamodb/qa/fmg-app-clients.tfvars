table_name     = "fmg-app-clients-qa"
capacity_mode  = "PROVISIONED"
read_capacity  = 1
write_capacity = 1
hash_key       = "ClientId"
attributes =  [
  {
    name = "ClientId"
    type = "S"
  }
 ] 
tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "06062024"
	"DataClassification"	= "None"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08082024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
