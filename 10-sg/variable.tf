variable "project"{
    default = "roboshop"
}

variable "env"{
    default = "dev"
}

variable "sg_names"{
    type = list
    default= [
        #database
        "mongodb",
        "redis",
        "mysql",
        "rabbitmq",

        #ingress ALB
        "ingress_ALB",

        #bastion
        "bastion",

        #vpn
        "openvpn",

        "eks_control_plane","eks_node"
    ]
}