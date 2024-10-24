resource "aws_db_subnet_group" "lambda_database_proxy_subnet_group" {
  name = "lambda_database_proxy_subnet_group"
  subnet_ids = [
    aws_subnet.lambda_database_proxy_subnet_1a.id,
    aws_subnet.lambda_database_proxy_subnet_1b.id
  ]

  tags = {
    Name = "lambda_database_proxy_subnet_group"
  }
}