# Database Instance Server Installation file
# IP
data "azurerm_resource_group" "rg" {
  name = "RG-${var.network_rg}"
}

data "azurerm_resource_group" "network_rg" {
  name = "RG-${var.network_rg}"
}

data "azurerm_virtual_network" "vnet" {
  name                = "VNET-${var.vnet}"
  resource_group_name = "${data.azurerm_resource_group.network_rg.name}"
}

data "azurerm_subnet" "subnet" {
  name                 = "SUBNET_SPOKE-DATABASE"
  virtual_network_name = "${data.azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${data.azurerm_resource_group.network_rg.name}"
}



resource "azurerm_network_interface" "db_server_nic" {
  count                         = "${length(var.db_server_niclist)}"
  name                          = "NIC_APP-${element(var.db_server_hostnamelist, count.index)}"
  location                      = "${data.azurerm_resource_group.rg.location}"
  resource_group_name           = "${data.azurerm_resource_group.rg.name}"
  enable_accelerated_networking = "true"

  ip_configuration {
    name                          = "PVT_IP-${element(var.db_server_niclist, count.index)}"
    subnet_id                     = "${element(data.azurerm_subnet.subnet.*.id,count.index)}"
    private_ip_address_allocation = "static"
    primary                       = true
    private_ip_address            = "${element(var.db_server_niclist, count.index)}"
  }

  tags = "${merge(var.tags_map, map("Name", element(var.db_server_hostnamelist, count.index)), map("Environment", var.environment), map("Component", "SAP Database"), map("Backup", var.backup))}"
}

resource "azurerm_virtual_machine" "db_server" {
  count                            = "${length(var.db_server_hostnamelist)}"
  name                             = "${element(var.db_server_hostnamelist, count.index)}"
  location                         = "${element(data.azurerm_resource_group.rg.*.location, count.index)}"
  resource_group_name              = "${element(data.azurerm_resource_group.rg.*.name, count.index)}"
  primary_network_interface_id     = "${element(azurerm_network_interface.db_server_nic.*.id,count.index)}"
  network_interface_ids            = ["${element(azurerm_network_interface.db_server_nic.*.id,count.index)}"]
  vm_size                          = "${var.db_vm_type}"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
 
  storage_image_reference {
     publisher = "SUSE"
    offer     = "SLES-SAP"
    sku       = "12-SP3"
    version   = "latest"
  }

  storage_os_disk {
    name              = "OS-disk-${element(var.db_server_hostnamelist, count.index)}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  # Optional data disks

  storage_data_disk {
    name              = "usrsap-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "64"
  }
  storage_data_disk {
    name              = "hanashared-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = "128"
  }
  storage_data_disk {
    name              = "hanadata1-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 2
    disk_size_gb      = "1024"
  }
  storage_data_disk {
    name              = "hanadata2-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 3
    disk_size_gb      = "1024"
  }
  storage_data_disk {
    name              = "hanadata3-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 4
    disk_size_gb      = "1024"
  }
  storage_data_disk {
    name                      = "hanalog1-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type         = "Premium_LRS"
    create_option             = "Empty"
    lun                       = 5
    disk_size_gb              = "1024"
   # write_accelerator_enabled = true
  }
  storage_data_disk {
    name                      = "hanalog2-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type         = "Premium_LRS"
    create_option             = "Empty"
    lun                       = 6
    disk_size_gb              = "1024"
    #write_accelerator_enabled = true
  }
  storage_data_disk {
    name              = "backup1-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 7
    disk_size_gb      = "4095"
  }
  storage_data_disk {
    name              = "backup2-${element(var.db_server_hostnamelist, count.index)}"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 8
    disk_size_gb      = "4095"
  }
  os_profile {
    computer_name  = "${element(var.db_server_hostnamelist, count.index)}"
   admin_username = "azureadmin"
    admin_password = "Azure@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = "${merge(var.tags_map, map("Name", element(var.db_server_hostnamelist, count.index)), map("Environment", var.environment), map("Component", "SAP HANA Database"), map("Backup", var.backup))}"
}
