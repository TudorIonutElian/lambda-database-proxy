resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "database_jumpbox_key" {
  key_name   = "database_jumpbox_key"      
  public_key = tls_private_key.privatekey.public_key_openssh

  provisioner "local-exec" { 
    command = "echo '${tls_private_key.privatekey.private_key_pem}' > ./database_jumbox.pem"
  }
}