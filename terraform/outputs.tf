output "external_ip_el_instance" {
  value = yandex_compute_instance.el-instance.network_interface.0.nat_ip_address
}
output "external_ip_k_instance" {
  value = yandex_compute_instance.k-instance.network_interface.0.nat_ip_address
}
output "external_ip_app_instance" {
  value = yandex_compute_instance.app-instance.network_interface.0.nat_ip_address
}