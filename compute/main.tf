resource "aws_instance" "web" {
  for_each = toset(var.subnet_ids)

  ami                    = var.ami_id # Ubuntu AMI ID
  instance_type          = "t2.micro"
  subnet_id              = each.value        # pick one subnet for each instance
  # subnet_id              = var.subnet_ids[0] # pick 
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "web-server"
  }
}


resource "aws_lb" "app_lb" {
  name               = "app-lb"
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.sg_id]
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "web_attach" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}
