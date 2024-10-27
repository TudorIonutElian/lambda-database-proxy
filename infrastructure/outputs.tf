
output "database_jumbox_key" {
  value = tls_private_key.privatekey.private_key_pem
}