
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  dynamic "listener" {
    for_each = var.listeners
    content {
      instance_port = listeners.value.instance_port
      instance_protocol      = listeners.value.instance_protocol
      lb_port               = listeners.value.lb_port           
      ssl_certificate_id = listeners.value.ssl_certificate_id
    }
  }
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}

variable "availability_zones" {
    type = list(string)
    default =[]
}



variable "connection_draining" {
    default = true
}

variable "connection_draining_timeout" {}

variable "idle_timeout" {
  default = 60
}

variable "listeners" {
  description = "Listeners added to the ELB"
  type        = map
}

variable "healthy_threshold" {}

variable "unhealthy_threshold" {}

variable "health_check_timeout" {}

variable "target" {}

variable "instances" {
  type = list(string)
  default =[]
}
   
   
   
   
   
   connection_draining = var.connection_draining
   connection_draining_timeout = var.connection_draining_timeout
   idle_timeout = var.idle_timeout

   dynamic "listener" {
    for_each = var.listeners
    content {
      instance_port = listeners.value.instance_port
      instance_protocol      = listeners.value.instance_protocol
      lb_port               = listeners.value.lb_port           
      ssl_certificate_id = listeners.value.ssl_certificate_id
    }
  }
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.health_check_timeout
    target              = var.target
    interval            = 30
  }
}