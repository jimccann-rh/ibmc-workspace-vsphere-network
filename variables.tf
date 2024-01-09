variable "ibmcloud_api_key" {
  type      = string
  sensitive = true
}

variable "iaas_classic_username" {
  type      = string
  sensitive = true
}

variable "iaas_classic_api_key" {
  type      = string
  sensitive = true
}

variable "subnet_capacity" {
  type = number
  default = 128
}

variable "vlan_id" {
  type = number
}

variable "datacenter" {
  type = string
}

variable "vlan_tags" {
  type = list(string)
}

