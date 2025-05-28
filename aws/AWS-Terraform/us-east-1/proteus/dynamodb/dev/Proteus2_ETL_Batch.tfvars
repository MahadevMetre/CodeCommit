table_name     = "Proteus2_ETL_Batch"
capacity_mode  = "PROVISIONED"
read_capacity  = 10
write_capacity = 10
hash_key       = "batchid"
range_key      = "datecreated"
attributes =  [
  {
    name = "batchid"
    type = "S"
  },
  {
    name = "datecreated"
    type = "S"
  }
 ] 
tags = {
		"ApplicationName": "Proteus2",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "10212023",
		"DataClassification": "Low",
		"Department": "PTS2",
		"Infrastructure": "False",
		"LastUpdated": "10212023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "2.0"
		}
