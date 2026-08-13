data "http" "my_ip" {
  url = "https://ipv4.icanhazip.com"
}

output "current_ip" {
  value = chomp(data.http.my_ip.response_body)
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.env}/bastion_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project}/${var.env}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project}/${var.env}/mysql_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project}/${var.env}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "ingress_ALB_sg_id" {
  name = "/${var.project}/${var.env}/ingress_ALB_sg_id"
}

data "aws_ssm_parameter" "openvpn_sg_id" {
  name = "/${var.project}/${var.env}/openvpn_sg_id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name = "/${var.project}/${var.env}/eks_control_plane_sg_id"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
  name = "/${var.project}/${var.env}/eks_node_sg_id"
}



