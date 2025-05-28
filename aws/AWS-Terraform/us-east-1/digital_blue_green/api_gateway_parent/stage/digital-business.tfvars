#APIGateway section
gw_endpoint_types	= ["REGIONAL"]
gw_create					= true
gw_desc						= "Digital Business IT APIGW Parent setup"
gw_name						= "digital-it-stage-serverless"
gw_path						= "rest"
gw_stage          = "it"

tags = {
  "ApplicationName"      = "Digital"
  "Automated"            = "True"
  "BackupPlan"           = "None"
  "CostCenter"           = "FMG"
  "CreatedBy"            = "DevOps"
  "CreatedOn"            = "09272024"
  "DataClassification"   = "Low"
  "Department"           = "DGT"
  "Infrastructure"       = "False"
  "LastUpdated"          = "09272024"
  "TechStack"            = "AWS"
  "Usage"                = "Project"
  "Version"              = "1.0"
}