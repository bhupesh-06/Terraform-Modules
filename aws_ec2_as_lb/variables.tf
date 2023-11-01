//launch_template variables
variable "lt_name" {
  default = "prod_lt-1"
}
variable "image_id" {
  default = "ami-0df7a207adb9748c7"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_pair_name" {
  default = "default"
}
# variable "lt_user_data" {
#   default = filebase64("${path.module}/user-data.sh") 
# }
# variable "security_groups" {
#     default = ["sg-0cf81af39dfee1ba7"]
# }

variable "tags" {
  type = map(any)
  default = {
    "Akash" = "ec2-as-lb" 
  }
}
variable "namespace" {
  type = string
  default = "Akash-T"
}
variable "env" {
  type = string
  default = "Dev"
}

//AS variables
variable "asg_name" {
  default = "tf_asg"
}
variable "min_size" {
  default = "1"
}
variable "max_size" {
  default = "2"
}
variable "desired_capacity" {
  default = "1"
}
variable "vpc_zone" {
  type    = list(string)
  default =  ["	subnet-0e8f6fe71e7832db1"]
}

//TG variables
variable "tg_name" {
  default = "demo-tg"
}
variable "tg_port" {
  default = "80"
}
variable "vpc_id" {
  default = "vpc-0dc79b82d54bda44c"
}

//ALB variables
variable "lb_name" {
  default = "demo-alb"
}
variable "lb_type" {
  default = "application"
}
variable "security_groups" {
  type    = list(any)
  default = ["sg-05d22107263290a6a"]
}