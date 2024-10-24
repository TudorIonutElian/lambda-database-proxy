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