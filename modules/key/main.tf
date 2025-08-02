# resource "aws_key_pair" "client_key" {
#     key_name = "server_key"
#     public_key = file("../modules/key/server_key.pub")
# }

data "aws_secretsmanager_secret" "server_key_pub" {
  name = "server-ssh-pub-key"
}

data "aws_secretsmanager_secret_version" "server_key_pub" {
  secret_id = data.aws_secretsmanager_secret.server_key_pub.id
}

resource "aws_key_pair" "client_key" {
  key_name   = "server-ssh-pub-key"
  public_key = jsondecode(data.aws_secretsmanager_secret_version.server_key_pub.secret_string)["server-ssh-pub-key"]
}