rule_set_name             = "hermes-archive-rule-set-dev"
rule_name          = "hermes-archive-ils-dev"
recipients    = [ "hermes-archive-ils-dev@franklinmadisonds.com" ]
enabled_bool  = true
scan_enabled_bool  = true
tls_policy_bool 	= "Require"

bucket_name = "customercommunications-email-dev"
position = "4"
topic_arn = "arn:aws:sns:us-east-1:116762271881:hermes_email_archive_topic_dev"
object_key_prefix = "ILS"
