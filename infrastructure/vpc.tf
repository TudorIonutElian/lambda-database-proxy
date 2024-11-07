/**
 * Create a VPC with DNS support and DNS hostnames enabled
  - The VPC will have a CIDR block of 10.0.0.0/16
  - The VPC will have DNS support enabled
  - The VPC will have DNS hostnames enabled
  - The VPC will have a tag with the key Name and the value lambda_database_proxy_vpc
 */
resource "aws_vpc" "lambda_database_proxy_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "lambda_database_proxy_vpc"
    Project = "lambda-database-proxy"
  }
}

resource "aws_subnet" "lambda_database_proxy_subnet" {
  count             = 2
  vpc_id            = aws_vpc.lambda_database_proxy_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.lambda_database_proxy_vpc.cidr_block, 8, count.index)
  availability_zone = ["eu-central-1a", "eu-central-1b"][count.index]

  tags = {
    Name    = "lambda-database-proxy-subnet-${count.index}"
    Project = "lambda-database-proxy"
  }
}