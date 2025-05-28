output "aws_ses_config_st_matching_type" {
    value= "${aws_ses_event_destination.this.matching_types}"
}