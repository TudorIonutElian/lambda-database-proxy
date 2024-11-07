// add a security group for the mysql cluster
resource "aws_security_group" "mysql_cluster_sg" {
  name        = "mysql-cluster-sg"
  description = "Security group for MySQL cluster"
  vpc_id      = aws_vpc.lambda_database_proxy_vpc.id
}

// add a security group for the ec2 jumpbox

resource "aws_security_group" "ec2_jumpbox_sg" {
  name        = "ec2-jumpbox-sg"
  description = "Security group for EC2 jumpbox"
  vpc_id      = aws_vpc.lambda_database_proxy_vpc.id
}

// add a security group for the rds proxy

resource "aws_security_group" "rds_proxy_sg" {
  name        = "rds-proxy-sg"
  description = "Security group for RDS proxy"
  vpc_id      = aws_vpc.lambda_database_proxy_vpc.id
}

// add a security group for the lambda function

resource "aws_security_group" "lambda_sg" {
  name        = "lambda-sg"
  description = "Security group for Lambda function"
  vpc_id      = aws_vpc.lambda_database_proxy_vpc.id
}