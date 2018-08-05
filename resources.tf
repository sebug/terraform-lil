resource "google_compute_network" "our_development_network" {
  name = "devnetwork"
  auto_create_subnetworks = false
}

resource "aws_vpc" "environment-example-two" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "terraform-aws-vpc-example-two"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.environment-example-two.id}",
  "availability_zone" = "eu-central-1a"
}

resource "aws_subnet" "subnet2" {
  cidr_block = "${cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)}"
  vpc_id = "${aws_vpc.environment-example-two.id}",
  "availability_zone" = "eu-central-1b"
}
