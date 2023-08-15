
output "foreach_vms_output" {
  description = "name instance"
  value = <<EOT
   [
    %{~ for value in yandex_compute_instance.vms ~}
    { 
     "name" = ${ value.name }
     "id" = ${ value.id }
     "fqdn" = ${ value.fqdn }
    },
    %{~ endfor ~}
    %{~ for value in yandex_compute_instance.count-vm ~}
    { 
     "name" = ${ value.name }
     "id" = ${ value.id }
     "fqdn" = ${ value.fqdn}
    },
    %{~ endfor ~}
    {
     "name" = ${yandex_compute_instance.mount-disk-vm.name}
     "id"   = ${yandex_compute_instance.mount-disk-vm.id}
     "fqdn" = ${yandex_compute_instance.mount-disk-vm.fqdn}
    }
   ]
  EOT
}

/*
output "count_vm_output" {
  description = "name instance"
  value = <<EOT
    %{~ for value in yandex_compute_instance.count-vm ~}
    "name" = ${ value.name }
    "id" = ${ value.id }
    "fqdn" = ${ value.fqdn }
    %{~ endfor ~}
  EOT
}


output "test4_output" {
  description = "name instance"
  value =[ for i in yandex_compute_instance.vms: "'name' = '${i.name}' \n 'id' = '${i.id}' \n 'fqdn' = ${i.fqdn}"] 
}

output "test2_output" {
  description = "name instance"
  value ={for i in yandex_compute_instance.vms: i.name => i.network_interface[0].nat_ip_address}
}

output "instance_public_ip" {
  description = "Public IP"
  value = [for x in yandex_compute_instance.vms:"ip = ${x.network_interface[0].nat_ip_address}"]
} 

output "vms" {
  description = "name instance"
  value = values(yandex_compute_instance.vms).* 
}

output "test5_output" {
  description = ""
  value = 
}

*/
