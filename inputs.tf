# -- Resource Group -- #
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}


# -- Postgres -- #
variable "server_name" {
  type        = string
  description = "The name of the postgres server"
}

variable "administrator_username" {
  type        = string
  description = "The login username for the postgres server"
  sensitive   = true
}

variable "administrator_password" {
  type        = string
  description = "The login password for the postgres server"
  sensitive   = true
}

variable "sku_name" {
  type        = string
  description = "The SKU name for the postgres server. The naming convention follows <tier>_<family>_<cores>"
  default     = "GP_Gen5_2"
}

variable "postgres_version" {
  type        = string
  description = "The postgres version"
  default     = "11"
}

variable "storage_mb" {
  type        = number
  description = "The max storage size in MB"
  default     = 102400
}

variable "backup_retention_days" {
  type        = number
  description = "The number of backup retention days"
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Clone backups and store in another region from the one where the server is being hosted"
  default     = false
}

variable "auto_grow_enabled" {
  type        = string
  description = "Automatically grow the storage when reaching its capacity and preventing the server becoming 'read-only'"
  default     = true
}


# -- Private Endpoint -- #
variable "private_endpoint_name" {
  type        = string
  description = "The name of the private endpoint"
}

variable "private_service_connection_name" {
  type        = string
  description = "The name of the private service connection"
}

variable "private_dns_zone_group_name" {
  type        = string
  description = "The name of the private DNS zone group"
}


# -- Private DNS Zone -- #
variable "private_dns_zone_name" {
  type        = string
  description = "The name of the private DNS zone"
}


# -- Private DNS Zone Virtual Network Link -- #
variable "virtual_network_link_name" {
  type        = string
  description = "The name of the private DNS zone virtual network link"
}


# -- Data Sources -- #
variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

# ---- MISC ---- #
variable "location" {
  type        = string
  description = "The region of where the resource is to be provisioned"
}
