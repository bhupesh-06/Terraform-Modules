variable "counting" {
  type = number
  default = 1
  
}

variable "instance_type" {
  type = string
  default = "t2.micro"

 }
variable "port" {
  type = number
  default = 22
   
}
variable "key_name" {
  type = string
  default = "id_rsa.pub"


   
}
variable "sg_name" {   
  type = string
  default = "Akash"
}
variable "tags" {
  

   
}
variable "description" {
  type = string
  default = "This is for ssh tarrfic"
   
}
variable "portip" {
  type = string
  default = "192.168.1.0/24"

   
}
variable "instance_monitoring" {
  type = bool
  default = true
    
}
variable "instance_termination" {
  type = bool
  default = false
}