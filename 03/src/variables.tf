###cloud vars

variable "sa_key_file" {
  type        = string
  default     = "key.json"
  description = "Service account key file"
}

/*
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
*/

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_resources" { 
  type = map(number)
  default = {
    cores         = 2,
    memory        = 1,
    core_fraction = 5
  }
  description = "Costumize VM(core, RAM, core fraction)"
}

variable "vm_platforms" {
  type    = map(string)
  default = {
    v1 = "standard-v1"
    v2 = "standart-v2"
  }
  description = "Platforms name"
}

variable "image_name" {
  type    = string
  default = "ubuntu-2004-lts"
  description = "Image relase name"
}

variable "vms_ssh_root_key" {
  type    = string
  default = ""
}

variable "custum_vms" {
  description = "Custumize VMs"
  type = list(object(
    {
      name          = string
      cores         = number
      memory        = number
      core_fraction = number
      size          = number
      type          = string
  }))
  default = []
}

variable "disk" {
  description = "Create new disk"
  type = map
  default = {
    name = "new-disk"
    type = "network-hdd"
    zone = "ru-central1-a"
    size = 1
  }
}
