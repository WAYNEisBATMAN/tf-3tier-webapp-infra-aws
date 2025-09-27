resource "aws_instance" "web" {
  for_each = toset(var.subnet_ids)

  ami           = var.ami_id # Ubuntu AMI ID
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)] # distribute instances across subnets
  # subnet_id              = var.subnet_ids[0] # Use this line to launch all instances in a specific subnet(first subnet here)
  vpc_security_group_ids = [var.sg_id]


  tags = {
    Name   = "web-server-${count.index + 1}"                        # Added +1 for human-friendly naming
    Subnet = "subnet-${(count.index % length(var.subnet_ids)) + 1}" # Tracks which subnet the instance is in
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
