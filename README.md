# Terraform Module AWS RDS Creation
## Infrastructure orchestration

We use [https://www.terraform.io/](Terraform) as our orchestration tool.

Module to create AWS RDS.

Example:

```
variable "environment" {
  default = "staging"
}

provider "aws" {
  access_key = "${var.aws["access_key"]}"
  secret_key = "${var.aws["secret_key"]}"
  region     = "${var.aws["region"]}"
}

module "glucodes-rds" {
  source    = "./rds"
  # region    = "${var.aws["region"]}"
  stack_name = "test"
  db_name = "test"
  subnet_ids = ["subnet-46e84e20", "subnet-caf81990"]
  vpc_security_group_ids = ["sg-74bd5709", "sg-f3b75d8e"]
  stack_details = {
    env = "${var.environment}"
    version = "v1.0"
    region = "${var.aws["region"]}"
  }
}

```
