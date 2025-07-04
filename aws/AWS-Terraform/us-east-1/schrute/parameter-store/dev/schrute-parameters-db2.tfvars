name        = "schrute-parameters-dev-db2data"
description = "Parameter Store for Schrute Dev db2data"
type        = "SecureString"
value = "{\"spring.db2.datasource.url\":\"jdbc:as400:devlsys5.franklin-madison.com;ART303DTA;\",\"spring.db2.datasource.driver-class-name\":\"com.ibm.as400.access.AS400JDBCDriver\",\"spring.db2.jpa.properties.hibernate.default_schema\":\"ART303DTA\",\"spring.db2.jpa.database-platform\":\"org.hibernate.dialect.DB2400Dialect\",\"spring.rds.postgres.datasource.url\":\"jdbc:postgresql://rds-postgres-priv-dev1.crsdewuox0qj.us-east-1.rds.amazonaws.com:5432/postgres\",\"spring.rds.postgres.jpa.properties.hibernate.default_schema\":\"hms_dev\",\"spring.rds.postgres.datasource.driver-class-name\":\"org.postgresql.Driver\",\"spring.rds.postgres.jpa.properties.hibernate.dialect\":\"org.hibernate.dialect.PostgreSQLDialect\",\"logging.level.org.hibernate.SQL\":\"DEBUG\",\"spring.jpa.hibernate.ddl-auto\":\"none\",\"org.fmg.auth.dev.url\":\"https://dev.mtservicesapps.franklinmadisonds.com/sharedservices-ws/rest/users/loginNewAD\",\"org.fmg.auth.dev.systemCode\":\"HMS\",\"jwt.token.secrete\":\"9a4f2c8d3b7a1e6f45c8a0b3f267d8b1d4e6f3c8a9d2b5f8e3a9c8b5f6v8a3d99a4f2c8d3b7a1e6f45c8a0b3f267d8b1d4e6f3c8a9d2b5f8e3a9c8b5f6v8a3d9\"}"
key_id      = "alias/schrute-parameter-dev/kms"
tier        = "Standard"
tags = {
	"ApplicationName"		= "Schrute"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09262024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09262024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}