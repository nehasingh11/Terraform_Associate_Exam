provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "hvs.Gl8UcdTeGP3yun9BiynZDPft"
}

data "vault_generic_secret" "phone_number" {
  path = "secret/app"
}

output "phone_number" {
  value = data.vault_generic_secret.phone_number.data["phone_number"]
  sensitive = true
}