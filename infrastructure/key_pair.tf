resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "database_jumpbox_key" {
  key_name   = "database_jumpbox_key"      
  public_key = file("${path.module}/database_jumpbox_key.pub")
}