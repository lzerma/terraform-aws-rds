variable "db_name" {}
variable "stack_name" {}
variable "stack_details" {
  type = "map"

  default = {
    env      = ""
    region   = ""
    version = ""
  }
}

variable "vpc_security_group_ids" {
  type = "list"
  default = [""]
}

variable "subnet_ids" {
  type    = "list"
  default = [""]
}

variable "rds" {
  type = "map"
  default = {
    username = "mysql_staging"
    password = "test123####"
  }
}
