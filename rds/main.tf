resource "aws_db_subnet_group" "mysql" {
  name       = "${format("db-%s-%s", var.stack_name, var.stack_details["env"])}"
  subnet_ids = "${var.subnet_ids}"
  description = "${format("db-%s-%s", var.stack_name, var.stack_details["env"])}"
  tags {
      "Name"       = "${format("%s-%s", var.stack_name, var.stack_details["env"])}"
      "stack_name" = "${var.stack_name}"
      "stack_version"   = "${var.stack_details["version"]}"
      "env" = "${var.stack_details["env"]}"
    }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "${var.db_name}"
  username             = "${var.rds["username"]}"
  password             = "${var.rds["password"]}"
  identifier           = "${format("%s-%s", var.stack_name, var.stack_details["env"])}"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  db_subnet_group_name = "${aws_db_subnet_group.mysql.name}"
  skip_final_snapshot = true

  tags {
      "Name"       = "${format("%s-%s", var.stack_name, var.stack_details["env"])}"
      "stack_name" = "${var.stack_name}"
      "stack_version"   = "${var.stack_details["version"]}"
      "env" = "${var.stack_details["env"]}"
    }
}
