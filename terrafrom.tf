// provider "azurerm" {
//   version = "=1.28.0"
// }

// resource "azurerm_resource_group" "DefaultResourceGroup-CUS" {
//   name     = "dev"
//   location = "centralus"
// }

// resource "azurerm_storage_account" "interviewvasindran" {
//   name                     = "${var.storageAccountName}"
//   resource_group_name      = "${azurerm_resource_group.DefaultResourceGroup-CUS.name}"
//   location                 = "${var.region}"
//   account_tier             = "${var.tier}"
//   account_replication_type = "${var.replicationType}"

// }


# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}
# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
# Create the resource group
resource "azurerm_resource_group" "DefaultResourceGroup-CUS" {
  name     = "myResourceGroup-BradyWeatherApplication"
  location = "centralus"
}
# Create the Linux App Service Plan
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-BradyWeatherApplication"
  location            = azurerm_resource_group.DefaultResourceGroup-CUS.location
  resource_group_name = azurerm_resource_group.DefaultResourceGroup-CUS.name
  sku {
    tier = "Free"
    size = "F1"
  }
}
# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "webapp-BradyWeatherApplication"
  location            = azurerm_resource_group.DefaultResourceGroup-CUS.location
  resource_group_name = azurerm_resource_group.DefaultResourceGroup-CUS.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  source_control {
    repo_url           = "https://github.com/vasindran/devops-interview"
    branch             = "main"
    manual_integration = true
    use_mercurial      = false
  }
}