output "app_vm_public_ip" {
  value = azurerm_public_ip.app.ip_address
}

output "tools_vm_public_ip" {
  value = azurerm_public_ip.tools.ip_address
}

output "ssh_private_key_path" {
  value = local_file.ssh_private_key.filename
}
