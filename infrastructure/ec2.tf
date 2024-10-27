
/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "rds_jumpbox" {
  ami           = data.aws_ami.ec2_ami_filter.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.database_jumpbox_key.key_name
  subnet_id = aws_subnet.lambda_database_proxy_subnet_1a.id
  vpc_security_group_ids = [aws_security_group.lambda_database_proxy_mysql_sg.id]

  tags = {
    Name = "lambda-database-proxy-func"
    Project = "lambda-database-proxy"
  }
}