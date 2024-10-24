resource "aws_subnet" "lambda_database_proxy_subnet_1a" {
  vpc_id                  = aws_vpc.lambda_database_proxy_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "lambda_database_proxy_subnet-1a"
    Project = "lambda-database-proxy"
  }
}

// add more subnets here

resource "aws_subnet" "lambda_database_proxy_subnet_1b" {
  vpc_id                  = aws_vpc.lambda_database_proxy_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "lambda_database_proxy_subnet-1b"
    Project = "lambda-database-proxy"
  }
}