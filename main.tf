module "lzerma-aws-rds" {
  source = "./rds"
  version = "0.0.5"

  stack_name = "${var.stack_name}"
  db_name = "${var.db_name}"

  subnet_ids = "${var.subnet_ids}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"

  stack_details = {
    env = "${var.stack_details["env"]}"
    version = "${var.stack_details["version"]}"
    region = "${var.stack_details["region"]}"
  }

  rds = {
     username                = "root"
     password                = "root"
     allocated_storage       = 10
     storage_type            = "gp2"
     instance_class          = "db.t2.micro"
     skip_final_snapshot     = true
   }
}
