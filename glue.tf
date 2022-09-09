resource "aws_glue_crawler" "glue_crawler-desafio1" {
  database_name = "datalake-parquet-rais"
  name          = "${var.glue_name}-${var.ambiente}-${var.numero_conta}"
  role          = "AWSGlueServiceRole-Pratico1"

  s3_target {
    path = "s3://datalake-pablo-908049444636/data-spark/"
  }
}
