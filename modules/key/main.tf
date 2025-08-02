# resource "aws_key_pair" "client_key" {
#     key_name = "server_key"
#     public_key = file("../modules/key/server_key.pub")
# }

data "aws_secretsmanager_secret_version" "server_key_pub" {
  secret_id = data.aws_secetsmanager_secret.server_key_pub.id
}

resource "aws_key_pair" "client_key" {
  key_name   = "3-tier_server_public_key"
  public_key = data.aws_secretsmanager_secret_version.ssh_key.secret_string
}