variable "vpc_cidr" { default = "10.0.0.0/16" }


variable "availability_zones_count" {
  description = "Number of availability zones to use"
  type        = number
  default     = 2
}





