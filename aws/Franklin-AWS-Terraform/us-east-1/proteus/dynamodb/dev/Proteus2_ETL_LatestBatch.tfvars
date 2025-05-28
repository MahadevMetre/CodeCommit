table_name                   = "Proteus2_ETL_LatestBatch"
capacity_mode                = "PROVISIONED"
read_capacity                = 1
write_capacity               = 1
hash_key                     = "program"
attributes =  [
  {
    name = "program"
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
