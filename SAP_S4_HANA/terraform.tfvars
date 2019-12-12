sid = "S4P"

# Resource Group Name will be RG-<SID>-<LOCATION> & RG will be hard coded
rg = "SAPLAB"
network_rg = "SAPLAB"

vnet = "SPOKE"

subnet_app = "APPLICATION"

location = "northeurope"

# SCS Variables

scs_vm_type = "Standard_DS3_v2"

scs_server_hostnamelist = ["azrhsp111", "azrhsp112"]

scs_server_niclist = ["10.1.1.11", "10.1.1.12"]

scs_ipmap = {
  "azrhsp111" = "10.1.1.11"
  "azrhsp112" = "10.1.1.12"
}

wd_vm_type = "Standard_DS3_v2"

wd_server_hostnamelist = ["azrhsp113", "azrhsp114"]

wd_server_niclist = ["10.1.1.13", "10.1.1.14"]

wd_ipmap = {
  "azrhsp113" = "10.1.1.13"
  "azrhsp114" = "10.1.1.14"
}

nfs_vm_type = "Standard_DS3_v2"

nfs_server_hostnamelist = ["azrhsp115", "azrhsp116"]

nfs_server_niclist = ["10.1.1.15", "10.1.1.16"]

nfs_ipmap = {
  "azrhsp115" = "10.1.1.15"
  "azrhsp116" = "10.1.1.16"
}

app_vm_type = "Standard_E8s_v3"

app_server_hostnamelist = ["azrhsp121", "azrhsp122", "azrhsp123"]

app_server_niclist = ["10.1.1.21", "10.1.1.22", "10.1.1.23"]

app_server_ipmap = {
  "azrhsp121" = "10.1.1.21"
  "azrhsp122" = "10.1.1.22"
  "azrhsp123" = "10.1.1.23"
}

db_vm_type = "Standard_M64s"

db_server_hostnamelist = ["azrhsp131", "azrhsp132"]

db_server_niclist = ["10.1.2.31", "10.1.2.32"]

db_server_ipmap = {
  "azrhsp131" = "10.1.2.31"
  "azrhsp132" = "10.1.2.32"
}
