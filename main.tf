provider "azurerm" {
    version = "=2.5.0"
    features {}
}
resource "azurerm_resource_group" "tf_tstrg" {
 name = "tfmainrg"
 location = "East US"
}

resource "azurerm_container_group" "tfcg_test" {
  name                  = "weagtherapi"
  location              = azurerm_resource_group.tf_tstrg.location
  resource_group_name   = azurerm_resource_group.tf_tstrg.name

  ip_address_type       = "public"
  dns_name_label        = "srinivasnineswa"
  os_type               = "Linux"
  container {
      name              = "weagtherapi"
      image             = "srinivasnines/weagtherapi"
      cpu               = "1"
      memory            = "1"
      ports{
          port          = 80
          protocol      = "TCP"
      }
  }
}
