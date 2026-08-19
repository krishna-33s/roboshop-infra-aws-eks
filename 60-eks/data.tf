data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project}/${var.env}/private_subnet_id"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
    name = "/${var.project}/${var.env}/eks_node_sg_id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
    name = "/${var.project}/${var.env}/eks_control_plane_sg_id"
}