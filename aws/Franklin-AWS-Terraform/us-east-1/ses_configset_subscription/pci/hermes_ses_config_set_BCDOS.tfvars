aws_ses_configuration_set_name             = "hermes_ses_config_set_BCDOS"
environment                 = "pci"
ses_destination_name="hermes_ses_config_set_BCDOS_destination"
aws_sns_topic_arn="arn:aws:sns:us-east-1:601751840347:hermes_ses_events_topic_pci"
matching_types=["bounce", "click", "delivery", "open", "send"]
