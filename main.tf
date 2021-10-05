terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
      #
      # For more information, see the provider source documentation:
      # https://github.com/josenk/terraform-provider-esxi
      # https://registry.terraform.io/providers/josenk/esxi
    }
  }
}

provider "esxi" {
  esxi_hostname      = var.esxi_hostname
  esxi_hostport      = var.esxi_hostport
  esxi_hostssl       = var.esxi_hostssl
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
}

resource "esxi_guest" "vmtest1" {
  guest_name         = "vmtest1"
  disk_store         = "mydatastore"

  #
  #  Specify an existing guest to clone, an ovf source, or neither to build a bare-metal guest vm.
  #
  #clone_from_vm      = "Templates/centos7"
  ovf_source        = "/home/chasingh/CentOS_7.8.2003_VMware_Minimal_Image_LinuxVMImages.ovf"
  boot_disk_type     = "thin"
  #boot_disk_size     = "1" 
  memsize            = "4096"
  numvcpus           = "1"
  virthwver          = "8"
  power              = "on"  
  
  network_interfaces {
    virtual_network = "VM Network 2"
  }
  
  ovf_properties {
    key = "password"
    value = "Passw0rd1"
  }

  ovf_properties {
    key = "hostname"
    value = "vmtest"
  }
}

resource "esxi_guest" "vmtest2" {
  guest_name         = "vmtest2"
  disk_store         = "mydatastore"

  #
  #  Specify an existing guest to clone, an ovf source, or neither to build a bare-metal guest vm.
  #
  #clone_from_vm      = "Templates/centos7"
  ovf_source        = "/home/chasingh/CentOS_7.8.2003_VMware_Minimal_Image_LinuxVMImages.ovf"
  boot_disk_type     = "thin"
  #boot_disk_size     = "1"
  memsize            = "4096"
  numvcpus           = "1"
  virthwver          = "8"
  power              = "on"

  network_interfaces {
    virtual_network = "VM Network 3"
  }

  ovf_properties {
    key = "password"
    value = "Passw0rd1"
  }

  ovf_properties {
    key = "hostname"
    value = "vmtest2"
  }
}

