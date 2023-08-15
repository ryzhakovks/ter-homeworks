resource "yandex_compute_instance" "vms" {
  
  for_each = { for k,v in var.custum_vms: v.name => v }

  depends_on = [ yandex_compute_instance.count-vm ]
  
  name = each.value.name
  platform_id = var.vm_platforms.v1
   
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.size
    }
  }

  scheduling_policy { preemptible = true }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.vms_ssh_root_key
  }
}
