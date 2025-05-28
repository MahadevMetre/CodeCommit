resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  count	             = var.dynamodb_table_read_target ? 1 : 0
  max_capacity       = var.read_capacity_maximum
  min_capacity       = var.read_capacity_minimum
  resource_id        = "table/Proteus2_ETL_LatestBatch"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target" {
  count	             = var.dynamodb_table_write_target ? 1 : 0
  max_capacity       = var.write_capacity_maximum
  min_capacity       = var.write_capacity_minimum
  resource_id        = "table/Proteus2_ETL_LatestBatch"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}
