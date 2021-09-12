# Private PostgreSQL Database for AzureRM

This module provisions a private PostgreSQL database and private endpoint for Microsoft Azure.

No public access, TLS enabled with minimum TLS version being 1.2.

## Pre-requisites
In order to provision a private endpoint, the subnet you are deploying the endpoint to needs to have private endpoint network policies disabled. You can do this using Azure CLI as so:

```
az network vnet subnet update \ 
  --disable-private-endpoint-network-policies true \
  --name <subnet_name> \ 
  --resource-group <resource_group_name> \ 
  --vnet-name <virtual_network_name> \ 
```

## Required Fields / Example Usage

You can see a full example of how to use this module in the _examples directory.

|            variable             | required |                                               description                                                |
|:-------------------------------:|:--------:|:--------------------------------------------------------------------------------------------------------:|
|       resource_group_name       |   true   |                                      The name of the resource group                                      |
|      virtual_network_name       |   true   |                                     The name of the virtual network                                      |
|           subnet_name           |   true   |                                          The name of the subnet                                          |
|            location             |   true   |                          The region of where the resource is to be provisioned                           |
|           server_name           |   true   |                                     The name of the postgres server                                      |
|       resource_group_name       |   true   |                                      The name of the resource group                                      |
|     administrator_username      |   true   |                                The login username for the postgres server                                |
|     administrator_password      |   true   |                                The login password for the postgres server                                |
|            sku_name             |   true   |       The SKU name for the postgres server. The naming convention follows <tier>_<family>_<cores>        |
|             version             |   true   |                                           The postgres version                                           |
|           storage_mb            |   true   |                                        The max storage size in MB                                        |
|      backup_retention_days      |   true   |                                   The number of backup retention days                                    |
|  geo_redundant_backup_enabled   |   true   |         Clone backups and store in another region from the one where the server is being hosted          |
|        auto_grow_enabled        |   true   | Automatically grow the storage when reaching its capacity and preventing the server becoming 'read-only' |
|      private_endpoint_name      |   true   |                                     The name of the private endpoint                                     |
| private_service_connection_name |   true   |                                The name of the private service connection                                |
|   private_dns_zone_group_name   |   true   |                                  The name of the private DNS zone group                                  |
|      private_dns_zone_name      |   true   |                                     The name of the private DNS zone                                     |
|    virtual_network_link_name    |   true   |                          The name of the private DNS zone virtual network link                           |

