variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "Project_MultiCloud_AZURE_RG"
}

variable "vnet_cidr" {
  default = "10.1.0.0/16"
}

variable "subnet_1_cidr" {
  default = "10.1.1.0/24"
}

variable "subnet_2_cidr" {
  default = "10.1.2.0/24"
}

variable "vm_size" {
  default = "Standard_B2ms"
}

variable "admin_username" {
  default = "azureuser"
}
