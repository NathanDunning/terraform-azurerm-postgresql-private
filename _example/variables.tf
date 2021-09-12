# -- Resource Group -- #
variable "resource_group_name" {
  type = string
}


# -- Virtual Network -- #
variable "virtual_network_name" {
  type = string
}


# -- Subnets -- #
variable "postgres_subnet_name" {
  type = string
}


# -- Postgres -- #
variable "postgres_server_name" {
  type = string
}

variable "postgres_admin_username" {
  type      = string
  sensitive = true
}

variable "postgres_admin_password" {
  type      = string
  sensitive = true
}


# -- Private Endpoint -- #
variable "postgres_private_endpoint_name" {
  type = string
}

variable "postgres_private_service_connection_name" {
  type = string
}

variable "postgres_private_dns_zone_group_name" {
  type = string
}

variable "postgres_private_dns_zone_name" {
  type = string
}

variable "postgres_virtual_network_link" {
  type = string
}
