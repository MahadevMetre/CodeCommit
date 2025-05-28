#APIGateway section
gw_endpoint_types	= ["REGIONAL"]
gw_create					= true
gw_desc						= "Marketing Business IT APIGW Parent setup"
gw_name						= "marketing-it-stage-serverless"
gw_path						= "rest"
gw_stage          = "it"

tags = {
  "ApplicationName"      = "Marketing"
  "Automated"            = "True"
  "BackupPlan"           = "None"
  "CostCenter"           = "FMG"
  "CreatedBy"            = "DevOps"
  "CreatedOn"            = "09272024"
  "DataClassification"   = "Low"
  "Department"           = "MKT"
  "Infrastructure"       = "False"
  "LastUpdated"          = "09272024"
  "TechStack"            = "AWS"
  "Usage"                = "Project"
  "Version"              = "1.0"
}