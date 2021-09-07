variable "rg" {
	default = "swissrg"
}

variable "vnet" {
	default = "swiss_vnet"
}

variable "subnet" {
	default = "swiss_subnet"
}

variable "public_ip" {
	default = "swiss_public_ip"
}

variable "nsg" {
	default = "swiss_nsg"
}

variable "nic" {
	default = "swiss_nic"
}

variable "ipcon" {
	default = "swiss_ipconfig"
}

variable "vm" {
	default = "swiss_vm"
}

variable "env" {
	description = "Select the environment type, dev or prod"
}

variable "location" {
	type = map
	description = "The location you want to deploy to, dev or prod"
	default = {
		"dev" = "eastus"
		"prod" = "westus"
}
}

variable "shh_public_key" {
	default = "AAAAB3NzaC1yc2EAAAABJQAAAQEAj7p1EtAIGqYWe5G6JkoFH9UmfxvW7oC4LoKCleRRwDbs6VXQvL+w8xEb7wHU7NX3MzmvQytgayvqqwzkZznXo82kAm8DFNsPIht3dJRR1IzVVqhH9q7WF9Wa7E7bOQgXAp5dheeV/j/9pFpTd/0TPvnZ8psTdH+TLe/tilgyGcz7HQTRHaGN0zy3OF7EL916Pub8xBjwAZqZPUVkzQgCeOxCjE/YjrKAGRypypyUg3g/krl5Gnog2BcVG4q5eS+Dqy7oD2nYJeGTdg+ifBvuUkyUIVLhZ/1U9wiKWcgTtQjADl6jMZiamJO1Vsmv3edwEYLgnjgPA7EC6sH9FMyXfw=="
}
