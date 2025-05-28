rule_set_name             = "hermes-archive-rule-set-qa"
rule_name          = "digital-archive-confirmation-qa"
recipients    = [ "conf-archive-qa@franklinmadisonds.com" ]
enabled_bool  = true
scan_enabled_bool  = true
tls_policy_bool 	= "Require"

bucket_name = "customercommunications-email-qa"
position = "2"
topic_arn = "arn:aws:sns:us-east-1:634621569833:digital-email-archive-topic-qa"
object_key_prefix = "DIGITAL/CONFIRMATION"
