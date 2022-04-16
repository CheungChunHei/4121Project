module "rds-aurora" {
  source         = "aws-quickstart/rds-aurora/aws"
  version        = "0.0.10"
  region         = var.region
  vpc_id         = var.db_vpc_id
  password       = var.password
}
