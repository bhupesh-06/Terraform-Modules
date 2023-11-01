variable "key_name" {
    type = string
  default = "id_rsa.pub"
}

variable "sec_group_name" {
    type = string
  default = "Akash-Sg"
}

variable "sec_group_description" {
  default = "Ansible Security Group - allow All Trafic to My IP"
}


variable "volume_size" {
  default = 8
}

variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
  default = [
    "0.0.0.0/0",
  ]
}

variable "instance_count" {
  default = "2"
}

variable "port_list" {
  description = "Allowed ports"
  type = list(number)
  default = [
    22,
    80,
    8080,
  ]
}