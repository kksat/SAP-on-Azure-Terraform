resource "azurerm_resource_group" "rg" {
  count    = "${length(var.rg)}"
  name     = "RG-${element(var.rg, count.index)}"
  location = "${var.location}"
  tags     = "${merge(var.tags_map, map("Environment", "Proof of Concept"))}"
}
