# SAP Provisioning



module "app_server" {
  source                  = "./modules/app_server"
  location                = "${var.location}"
  sid                     = "${var.sid}"
  network_rg              = "${var.network_rg}"
  app_vm_type             = "${var.app_vm_type}"
  app_server_hostnamelist = "${var.app_server_hostnamelist}"
  app_server_niclist      = "${var.app_server_niclist}"
  app_server_ipmap        = "${var.app_server_ipmap}"
  tags_map                = "${var.tags_map}"
}



module "db_server" {
  source                 = "./modules/db_server"
  location               = "${var.location}"
  sid                    = "${var.sid}"
  network_rg             = "${var.network_rg}"
  db_vm_type             = "${var.db_vm_type}"
  db_server_hostnamelist = "${var.db_server_hostnamelist}"
  db_server_niclist      = "${var.db_server_niclist}"
  db_server_ipmap        = "${var.db_server_ipmap}"
  tags_map               = "${var.tags_map}"
}
