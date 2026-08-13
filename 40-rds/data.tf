data "aws_ssm_parameter" "database_subnet_group_name" {
  name = "/${var.project}/${var.env}/database_subnet_group_name"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project}/${var.env}/mysql_sg_id"
}