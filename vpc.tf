resource "aws_vpc" "test-net" {
  cidr_block           = "${var.vpc["cidr_block"]}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    name      = "Test Network"
    buildwith = "Terraform"
  }
}
