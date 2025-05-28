rule_set_name             = "hermes-archive-rule-set-stage"
rule_name          = "hermes-archive-ils-stage"
recipients    = [ "hermes-archive-ils-stage@franklinmadisonds.com" ]
enabled_bool  = true
scan_enabled_bool  = true
tls_policy_bool 	= "Require"

bucket_name = "customercommunications-email-stage"
position = "4"
topic_arn = "arn:aws:sns:us-east-1:702230634984:hermes_email_archive_topic_stage"
object_key_prefix = "ILS"
