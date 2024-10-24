resource "aws_security_group_rule" "lambda_database_proxy_mysql_sg_rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.lambda_database_proxy_mysql_sg.id
  cidr_blocks       = [aws_subnet.lambda_database_proxy_subnet.cidr_block]
}