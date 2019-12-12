# Group for all this resources
rg = "SAPLAB"

sid = "S4P"

location = ["northeurope"]

# HUB &  SPOKE  Virtual Network  

vnet = ["HUB", "SPOKE"]

vnet_cidr = ["10.0.0.0/16", "10.1.0.0/16"]

vnet_cidrmap = {
  "HUB"   = "10.0.0.0/16"
  "SPOKE" = "10.1.0.0/16"
}

#  Hub subnet
subnets_hub_names = ["GATEWAY", "DMZ"]

subnet_hub_cidr = ["10.0.0.0/24", "10.0.1.0/24"]

subnet_hub_cidrmap = {
  "GATEWAY" = "10.0.0.0/24"
  "DMZ"     = "10.0.1.0/24"
}

# Spoke subnet

subnets_spoke_names = ["APPLICATION", "DATABASE"]

subnet_spoke_cidr = ["10.1.1.0/24", "10.1.2.0/24"]

subnet_spoke_cidrmap = {
  
  "APPLICATION" = "10.1.1.0/24"
  "DATABASE"     = "10.1.2.0/24"
}

# Primary Region = WESTUS2
# Secondary Redgion = EASTUS2

#TAG MAP

tags_map = {
  Environment   = "SAPonAzure Lab"
  Created_By    = "Vinod Deshmukh"
  Created_Using = "Terraform"
}
