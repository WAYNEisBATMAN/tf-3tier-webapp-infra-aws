variable "ami_id" { default = "ami-02d26659fd82cf299" } # Amazon Linux 2

variable "instance_count" {
  default = 2
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for EC2 and ALB"
}

variable "sg_id" {}

variable "vpc_id" {}
