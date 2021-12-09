# holds our configuration code
terraform{
  
  backend "azurerm" {
    resource_group_name = "tf_rg_blobstore"
    storage_account_name = "maxbecerratfstorage"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
  
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

resource "azurerm_resource_group" "tf_test" {
  name = "tfmainrg"
  location = "francecentral"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.tf_test.location
  resource_group_name = azurerm_resource_group.tf_test.name
  
  os_type             = "Linux"
  ip_address_type     = "public"
  dns_name_label      = "binarythistlewa"
  
  container {
    name   = "weatherapi"
    image  = "mvximvs/weatherapi"
    cpu    = 1
    memory = 1
    
    ports{
      port = 80 
      protocol = "TCP"
    }
  }
}

## Commands
# init
# plan
# apply
# destroy