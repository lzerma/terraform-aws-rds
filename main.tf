module "lzerma-aws-rds" {
  source = "./rds"
  version = "0.0.5"

  stack_name = "test"
  db_name = "test"

  subnet_ids = ["subnet-46e84e20", "subnet-caf81990"]
  vpc_security_group_ids = ["sg-74bd5709", "sg-f3b75d8e"]

  stack_details = {
    env = "${var.environment}"
    version = "${var.stack_details["version"]}"
    region = "${var.aws["region"]}"
  }
}
