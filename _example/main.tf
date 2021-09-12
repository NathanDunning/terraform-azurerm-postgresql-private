# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

# Retrieve data source for location
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

# Create a private postgres database
module "postgres" {
  source = "../"

  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = var.postgres_subnet_name
  location             = data.azurerm_resource_group.main.location

  server_name                  = var.postgres_server_name
  administrator_username       = var.postgres_admin_username
  administrator_password       = var.postgres_admin_password
  sku_name                     = "GP_Gen5_2" # Non-variable - General Purpose, Gen5, 2 vCores, 2 GB memory
  postgres_version             = "11"        # Non-variable - Postgres 11
  storage_mb                   = 102400      # Non-variable - 100 GB
  backup_retention_days        = 7           # Non-variable
  geo_redundant_backup_enabled = true        # Non-variable
  auto_grow_enabled            = false       # Non-variable

  private_endpoint_name           = var.postgres_private_endpoint_name
  private_service_connection_name = var.postgres_private_service_connection_name
  private_dns_zone_group_name     = var.postgres_private_dns_zone_group_name
  private_dns_zone_name           = var.postgres_private_dns_zone_name
  virtual_network_link_name       = var.postgres_virtual_network_link
}
