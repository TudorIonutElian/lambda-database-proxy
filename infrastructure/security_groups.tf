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

// Define security group rules

// Allow inbound traffic from EC2 jumpbox to MySQL cluster on port 3306
resource "aws_security_group_rule" "mysql_cluster_ingress_from_ec2_jumpbox" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.mysql_cluster_sg.id
  source_security_group_id = aws_security_group.ec2_jumpbox_sg.id
}

// Allow inbound traffic from RDS proxy to MySQL cluster on port 3306
resource "aws_security_group_rule" "mysql_cluster_ingress_from_rds_proxy" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.mysql_cluster_sg.id
  source_security_group_id = aws_security_group.rds_proxy_sg.id
}

// Allow inbound traffic from Lambda to RDS proxy on port 3306
resource "aws_security_group_rule" "rds_proxy_ingress_from_lambda" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_proxy_sg.id
  source_security_group_id = aws_security_group.lambda_sg.id
}

// Allow outbound traffic from RDS proxy to MySQL cluster on port 3306
resource "aws_security_group_rule" "rds_proxy_egress_to_mysql_cluster" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.rds_proxy_sg.id
  source_security_group_id = aws_security_group.mysql_cluster_sg.id
}

// Allow outbound traffic from Lambda to RDS proxy on port 3306
resource "aws_security_group_rule" "lambda_egress_to_rds_proxy" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.lambda_sg.id
  source_security_group_id = aws_security_group.rds_proxy_sg.id
}