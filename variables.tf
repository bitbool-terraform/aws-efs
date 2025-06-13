variable "project" {}
variable "systemenv" {}


variable "share_name" {}

variable "vpc_id" {}
variable "vpc_cidr" {}
variable "subnet_ids" {}




variable "tags" { default = null }
variable "uid" { default = 1000 }
variable "gid" { default = 1000 }
variable "path" { default = "" }
variable "permissions" { default = "0755" }

