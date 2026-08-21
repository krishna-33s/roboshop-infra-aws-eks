data "aws_ssm_parameter" "ingress_ALB_sg_id" {
  name = "/${var.project}/${var.env}/ingress_ALB_sg_id"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project}/${var.env}/public_subnet_id"
}

data "aws_ssm_parameter" "aws_certificate_arn" {
  name = "/${var.project}/${var.env}/aws_certificate_arn"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.env}/vpc_id"
}