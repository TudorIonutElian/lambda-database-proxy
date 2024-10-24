resource "aws_security_group" "lambda_database_proxy_mysql_sg" {
  name        = "lambda_database_proxy_mysql_sg"
  description = "Allow inbound traffic on port 3306"
  vpc_id      = aws_vpc.lambda_database_proxy_vpc.id
}