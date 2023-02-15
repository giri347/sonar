

resource "azurerm_service_plan" "webplan" {
  name                = var.webplanname
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webappname
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.webplan.id
  tags                = var.tags

  site_config {}
}