resource "aws_subnet" "lambda_database_proxy_subnet" {
  vpc_id                  = aws_vpc.lambda_database_proxy_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "lambda_database_proxy_subnet"
    Project = "lambda-database-proxy"
  }
}