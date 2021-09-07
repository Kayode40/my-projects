output "vm_public_ip" {
	description = "Public IP address of the vm"
	value       = azurerm_public_ip.myip.ip_address
}

#output "tls_private_key" { 
	#description = "TLS private key"
	#value 		= tls_private_key.example_ssh.private_key_pem 
#}