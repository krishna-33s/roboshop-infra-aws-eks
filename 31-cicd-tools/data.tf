data "aws_ami" "redhat" {
    most_recent      = true
    owners           = ["973714476881"]

    filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}
data "aws_ami" "sonarqube" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["SolveDevOps-SonarQube-Server-Ubuntu24.04-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ssm_parameter" "public_subnet_id" {
    name = "/${var.project}/${var.env}/public_subnet_id"
}

data "aws_ssm_parameter" "jenkins_sg_id" {
    name = "/${var.project}/${var.env}/jenkins_sg_id"
}

data "aws_ssm_parameter" "jenkins_agent_sg_id" {
    name = "/${var.project}/${var.env}/jenkins_agent_sg_id"
}

data "aws_ssm_parameter" "sonarqube_sg_id" {
    name = "/${var.project}/${var.env}/sonarqube_sg_id"
}
