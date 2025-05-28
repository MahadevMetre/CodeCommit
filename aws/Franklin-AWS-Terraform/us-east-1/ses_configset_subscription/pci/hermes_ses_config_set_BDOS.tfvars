aws_ses_configuration_set_name             = "hermes_ses_config_set_BDOS"
environment                 = "pci"
ses_destination_name="hermes_ses_config_set_BDOS_destination"
aws_sns_topic_arn="arn:aws:sns:us-east-1:601751840347:hermes_ses_events_topic_pci"
matching_types=["bounce", "delivery", "open", "send"]
