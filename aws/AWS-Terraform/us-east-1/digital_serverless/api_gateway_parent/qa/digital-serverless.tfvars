#APIGateway section
gw_endpoint_types	= ["REGIONAL"]
gw_create					= true
gw_desc						= "Digital serverless APIGW Parent setup"
gw_name						= "digitalselfservice-qa-serverless"
gw_path						= "rest"
gw_stage          = "qa"

tags = {
  "ApplicationName"      = "Digital"
  "Automated"            = "True"
  "BackupPlan"           = "None"
  "CostCenter"           = "FMG"
  "CreatedBy"            = "DevOps"
  "CreatedOn"            = "08232024"
  "DataClassification"   = "Low"
  "Department"           = "DGT"
  "Infrastructure"       = "False"
  "LastUpdated"          = "08232024"
  "TechStack"            = "AWS"
  "Usage"                = "Project"
  "Version"              = "1.0"
}