output "app_machine_public_ip" {
  value = aws_instance.app_machine.public_ip
}

output "tools_machine_public_ip" {
  value = aws_instance.tools_machine.public_ip
}

output "private_key_path" {
  value = local_file.private_key.filename
}
