output "key_name" {
  value = aws_key_pair.client_key.key_name
}

# output "key_name" {
#   description = "The name of the key pair"
#   value       = aws_key_pair.client_key.key_name
# }

# output "ssh_key_value" {
#   value     = data.aws_secretsmanager_secret_version.server_key_pub.secret_string
#   sensitive = true
# }
