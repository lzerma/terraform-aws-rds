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
    username                = "root"
    password                = "root"
    allocated_storage       = 10
    storage_type            = "gp2"
    instance_class          = "db.t2.micro"
    skip_final_snapshot     = true
  }
}
