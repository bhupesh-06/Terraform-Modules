variable "cluster_name" {
  type = string
  default = "test_eks_cluster"
}

variable "node_group_name" {
  type = string
  default = "test_node_group"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-05153c14327a7a119", "subnet-0c65799818d4d1830"]
}

variable "desired_size" {
  type = number
  default = 1
}

variable "max_size" {
  type = number
  default = 2
}

variable "min_size" {
  type = number
  default = 1
}