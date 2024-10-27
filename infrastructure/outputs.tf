
output "database_jumbox_key" {
  sensitive = true
  value = tls_private_key.privatekey.private_key_pem
}