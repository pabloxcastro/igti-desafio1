resource "aws_emr_cluster" "emr-cluster-desafio1" {
  name          = "${var.emr_name}-${var.ambiente}-${var.numero_conta}"
  release_label = "emr-6.0.0"
  applications  = ["Spark", "Hive", "Hue", "JupyterHub"]

  ec2_attributes {
    subnet_id                         = "subnet-057a9f9742ccbc183" # aws_subnet.main.id 
    emr_managed_master_security_group = "sg-01734c4e0163e4980"     # aws_security_group.sg.id
    emr_managed_slave_security_group  = "sg-0a4027d90f17dc6ad"     # aws_security_group.sg.id 
    instance_profile                  = aws_iam_instance_profile.emr_profile.arn
  }

  master_instance_group {
    instance_type = "m5.xlarge"
  }

  core_instance_group {
    instance_type  = "m5.xlarge"
    instance_count = 1

    ebs_config {
      size                 = "40"
      type                 = "gp2"
      volumes_per_instance = 1
    }
  }

  configurations = "test-fixtures/emr_configurations.json"

  service_role = "EMR_DefaultRole" #aws_iam_role.iam_emr_service_role.arn

  termination_protection = false

}


resource "aws_iam_instance_profile" "emr_profile" {
  name = "emr_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "test_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
