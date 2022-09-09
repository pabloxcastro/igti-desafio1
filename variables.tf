variable "base_bucket_name" {
  default = "datalake-igti-desafio1-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "908049444636"
}

/*
* EMR
*/
variable "emr_name" {
  default = "emr-igti-desafio1-tf"
}

variable "aws_subnet" {
  default = "subnet-092c34ee81a37b0d1"
}
variable "aws_security_group_master" {
  default = "sg-01734c4e0163e4980"
}
variable "aws_security_group_worker" {
  default = "sg-0a4027d90f17dc6ad"
}
variable "aws_iam_instance_profile" {
  default = "EMR_EC2_DefaultRole"
}

/*
* GLUE
*/
variable "glue_name" {
  default = "glue-igti-desafio1-tf"
}



