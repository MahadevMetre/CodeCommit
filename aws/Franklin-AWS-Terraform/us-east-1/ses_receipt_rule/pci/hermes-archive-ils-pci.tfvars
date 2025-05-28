rule_set_name             = "hermes-archive-rule-set-pci"
rule_name          = "hermes-archive-ils-pci"
recipients    = [ "hermes-archive-ils-pci@franklinmadisonds.com" ]
enabled_bool  = true
scan_enabled_bool  = true
tls_policy_bool 	= "Require"

bucket_name = "customercommunications-email-pci"
position = "4"
topic_arn = "arn:aws:sns:us-east-1:601751840347:hermes_email_archive_topic_pci"
object_key_prefix = "ILS"
