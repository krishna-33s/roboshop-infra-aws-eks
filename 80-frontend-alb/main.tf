# Application Load Balancer
resource "aws_lb" "frontend_alb" {
  name               = "frontend-alb-${var.project}-${var.env}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.ingress_alb_sg_id]
  subnets            = local.public_subnet_id

  # true means we can't delete load balancer with terrraform
  enable_deletion_protection = false

  tags = merge(
    {
        Name = "frontend-alb-${var.project}-${var.env}"
    },
    local.common_tags
  )
}

# creating listener https:443
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.aws_certificate_arn

  
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "<h3> hii this frontend-alb listener with https:443 port.this server is fine</h3>"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "frontend" {
  name     = "${var.project}-${var.env}-frontend"
  port     = 80
  protocol = "HTTP"
  # if this is VM target group, then target_type should be instance. if target_type is IP pods will come and register here
  target_type = "ip"
  vpc_id   = local.vpc_id
  deregistration_delay = 60

  health_check {
    healthy_threshold = 2
    interval = 10
    matcher = "200-299"
    path = "/"
    port = 80
    protocol = "HTTP"
    timeout = 2
    unhealthy_threshold = 3
  }
}

# This depends on target group
resource "aws_lb_listener_rule" "frontend" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }

  condition {
    host_header {
      values = ["${var.project}-${var.env}.${var.domain_name}"]
    }
  }
}

# route 53 record
resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}