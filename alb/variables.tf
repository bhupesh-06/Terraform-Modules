variable "alb_name" {
  default     = "default"
  description = "The name of the loadbalancer"
  
}

variable "environment" {
  description = "The name of the environment"
  type = string
  default = "Dev"
}

variable "public_subnet_ids" {
  type        = list
  description = "List of public subnet ids to place the loadbalancer in"
  default = ["subnet-0f9fa8b69b23a58b6", "subnet-0f4836c018efc9b4e"]

}


variable "vpc_id" {
  description = "The VPC id"
  type = string
  default = "vpc-0ce32832a570cbbc9"
}

variable "deregistration_delay" {
  default     = "300"
  description = "The default deregistration delay"
}

variable "health_check_path" {
  default     = "/"
  description = "The default health check path"
}

variable "allow_cidr_block" {
  default     = ["0.0.0.0/0"]
  description = "Specify cidr block that is allowed to access the LoadBalancer"
}
