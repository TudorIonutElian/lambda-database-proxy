
/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "rds_jumpbox" {
  ami           = data.aws_ami.ec2_ami_filter.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.database_jumpbox_key.key_name

  tags = {
    Name = "lambda-database-proxy-func"
    Project = "lambda-database-proxy"
  }
}