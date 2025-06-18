variable "share_name" {}

variable "vpc_id" {}
variable "cidr_access_from" {}
variable "subnet_ids" {}




variable "tags" { default = null }
variable "uid" { default = 1000 }
variable "gid" { default = 1000 }
variable "path" { default = "" }
variable "permissions" { default = "0755" }

