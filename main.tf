terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

provider "ibm" {
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

resource "ibm_network_vlan" "vsphere_vlan" {
  name            = "vsphere_vlan"
  datacenter      = var.datacenter
  router_hostname = var.router
  type            = "PRIVATE"
  tags = var.vlan_tags
}


resource "ibm_network_gateway_vlan_association" "gateway_vlan_association" {
  count = var.vlan_quantity

  gateway_id      = var.gateway_id
  network_vlan_id = ibm_network_vlan.vsphere_vlan.id
  bypass          = false
}


resource "ibm_subnet" "portable_subnet" {
  count = var.vlan_quantity

  type       = "Portable"
  private    = true
  ip_version = 4
  capacity   = var.subnet_capacity
  vlan_id    = ibm_network_vlan.vsphere_vlan.id
  notes      = "vsphere_vlan"
  tags = var.vlan_tags

  //User can increase timeouts
  timeouts {
    create = "45m"
  }
}

