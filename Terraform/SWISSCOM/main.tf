# Create a resource group
resource "azurerm_resource_group" "myrg" {
    name     = join("_", [var.vm, var.env])
    location = lookup (var.location, var.env)
}

# Create virtual network
resource "azurerm_virtual_network" "myvnet" {
    name                = var.vnet
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

# Create subnet
resource "azurerm_subnet" "mysubnet" {
    name                 = var.subnet
    resource_group_name  = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes       = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myip" {
    name                         = var.public_ip
    location                     = azurerm_resource_group.myrg.location
    resource_group_name          = azurerm_resource_group.myrg.name
    allocation_method            = "Static"

}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "mynsg" {
  name                = var.nsg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}

  security_rule {
    name                       = "SSH"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}
}

# Create network interface
resource "azurerm_network_interface" "mynic" {
    name                      = var.nic
    location                  = azurerm_resource_group.myrg.location
    resource_group_name       = azurerm_resource_group.myrg.name

    ip_configuration {
        name                          = var.ipcon
        subnet_id                     = azurerm_subnet.mysubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myip.id
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsgassociation" {
    network_interface_id      = azurerm_network_interface.mynic.id
    network_security_group_id = azurerm_network_security_group.mynsg.id
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.myrg.name
    }
    byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "mystorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.myrg.name
    location                    = azurerm_resource_group.myrg.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}

# Create virtual machine
resource "azurerm_virtual_machine" "myvm" {
    name                  = join("_", [var.vm, var.env])
    location              = azurerm_resource_group.myrg.location
    resource_group_name   = azurerm_resource_group.myrg.name
    network_interface_ids = [azurerm_network_interface.mynic.id]
    vm_size                  = "Standard_B2s"

    storage_os_disk {
        name                = join("_", [var.vm, "osdisk"])
        caching             = "ReadWrite"
        managed_disk_type   = "Premium_LRS"
        create_option       = "FromImage"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
        admin_password = "Kayodevirtualmachine@123$."
    }
    os_profile_linux_config {
        disable_password_authentication = false
}
}
	
resource "azurerm_managed_disk" "datadisk" {
	name                 = join("_", [var.vm, "disk1"])
	location             = azurerm_resource_group.myrg.location
	resource_group_name  = azurerm_resource_group.myrg.name
	storage_account_type = "Standard_LRS"
	create_option        = "Empty"
	disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadiskattach" {
  managed_disk_id    = azurerm_managed_disk.datadisk.id
  virtual_machine_id = azurerm_virtual_machine.myvm.id
  lun                = "10"
  caching            = "ReadWrite"
}