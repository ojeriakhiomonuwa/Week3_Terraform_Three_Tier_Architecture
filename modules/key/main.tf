# resource "aws_key_pair" "client_key" {
#     key_name = "server_key"
#     public_key = file("../modules/key/server_key.pub")
# }

data "aws_secretsmanager_secret_version" "ssh_key" {
  secret_id = "my-ssh-public-key"
}

resource "aws_key_pair" "client_key" {
  key_name   = "3-tier_server_public_key"
  public_key = data.aws_secretsmanager_secret_version.ssh_key.secret_string
}