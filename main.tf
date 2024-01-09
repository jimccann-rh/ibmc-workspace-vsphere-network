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


resource "ibm_subnet" "portable_subnet" {
  count = var.vlan_quantity

  type       = "Portable"
  private    = true
  ip_version = 4
  capacity   = var.subnet_capacity
  vlan_id    = var.vlan_id
  notes      = "vsphere_vlan"
  tags = var.vlan_tags

  //User can increase timeouts
  timeouts {
    create = "45m"
  }
}

