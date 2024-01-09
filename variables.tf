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
  default = 64
}

variable "vlan_id" {
  type = number
}

variable "vlan_tags" {
  type = list(string)
}

