job_name = "RDS_ETL_Wrapper"
role_arn = "arn:aws:iam::116762271881:role/fmadison-dw-glue-to-redshift"
cmd_name = "pythonshell"
cmd_python_version = "3"
cmd_script_location = "s3://franklin-warehouse-working/artifacts/glue-scripts/redshift_jobs/RDS_ETL_Wrapper.py"
max_concurrent_runs = "50"
execution_class = "STANDARD"
max_capacity = "0.0625"
connections = ["redshift-master", "redshift-changes", "hermes_connection"]
default_arguments = {
	"--class" = "GlueApp"
	"--extra-py-files" = "s3://franklin-warehouse-working/artifacts/glue-scripts/lib/fmg_dw_conn-0.1-py3-none-any.whl"
	"--enable-job-insights" = "false"
	"--job-language" = "python"
}