sid = "S4P"

# Resource Group Name will be RG-<SID>-<LOCATION> & RG will be hard coded
rg = "SAPLAB"
network_rg = "SAPLAB"

vnet = "SPOKE"

subnet_app = "APPLICATION"

location = "northeurope"


app_vm_type = "Standard_E8s_v3"

app_server_hostnamelist = ["azrhsp121"]

app_server_niclist = ["10.1.1.21"]

app_server_ipmap = {
  "azrhsp121" = "10.1.1.21"
}

db_vm_type = "Standard_E32s_v3"

db_server_hostnamelist = ["azrhsp131"]

db_server_niclist = ["10.1.2.31"]

db_server_ipmap = {
  "azrhsp131" = "10.1.2.31"
}
