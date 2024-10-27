
/**********************************************************
  # Create Ec2 Instance called ec2-jumpbox-instance
**********************************************************/
resource "aws_instance" "rds_jumpbox" {
  ami           = data.aws_ami.ec2_ami_filter.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.database_jumpbox_key.key_name
  associate_public_ip_address = true  

  tags = {
    Name = "ec2-jumpbox-instance"
    Project = "lambda-database-proxy"
  }
}