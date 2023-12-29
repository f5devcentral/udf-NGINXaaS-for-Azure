resource "azurerm_user_assigned_identity" "n4a" {
  location = "${var.location}"
  name = "n4a-identity"
  resource_group_name = "${var.resource_group_name}"
}