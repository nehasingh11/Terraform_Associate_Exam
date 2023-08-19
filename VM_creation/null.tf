resource "null_resource" "nl" {
  depends_on = [azurerm_linux_virtual_machine.my_terraform_vm]
  # Connection Block for Provisioners to connect to Azure VM Instance
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
    user        = azurerm_linux_virtual_machine.my_terraform_vm.admin_username
    private_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir /tmp/test",
      "sudo rm -rf /tmp/test",

      "function check_git_version () {",
      "git --version 2> /dev/null 1> a.txt",
      "c=$(grep 'git version' ./a.txt | wc -l)",
      "return $c",
      "}",
      "sudo yum install -y git",

      "check_git_version",


      "while [ $? -eq 0 ];  do",
      "       echo 'we will be waiting for 10 seconds.....'",
      "      sleep 10",
      "     check_git_version",
      "done",

      "sudo git clone https://github.com/nehasingh11/Linux_web_app_script.git /tmp/test",
      "sudo bash /tmp/test/app-script.sh",
    ]
  }
}