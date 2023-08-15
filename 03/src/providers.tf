terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  #token     = var.token
  service_account_key_file = var.sa_key_file
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
