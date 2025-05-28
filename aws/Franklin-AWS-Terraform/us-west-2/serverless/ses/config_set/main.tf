data "aws_caller_identity" "current" {}

resource "aws_sesv2_configuration_set" "ses_config_set" {
	configuration_set_name			= var.config_set_name
	delivery_options {
		tls_policy					= "REQUIRE"
	}
	reputation_options {
		reputation_metrics_enabled	= false
	}
	tags = var.config_set_tags
}

resource "aws_sesv2_configuration_set_event_destination" "ses_event_destination" {
	event_destination_name		= var.event_dest_name
	configuration_set_name		= aws_sesv2_configuration_set.ses_config_set.configuration_set_name
	event_destination {
		sns_destination {
			topic_arn			= var.sns_topic_arn
		}
		enabled					= true
		matching_event_types	= var.event_types
	}
}