
resource "tls_private_key" "key" {
  algorithm = "RSA"
  
}

resource "local_file" "file" {
  content = tls_private_key.key.private_key_pem
  filename = "myazurekey.pem"

}