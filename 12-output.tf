
# output "lb_static_ip_address" {
#   description = "The static IP address of the load balancer."
#   value       = "http://${google_compute_global_address.lb.address}"
# }


# # # https://developer.hashicorp.com/terraform/language/functions/join
# output "compute_zones" {
#   description = "Comma-separated compute zones"
#   # convert set into string delimited by commas (CSV) before output
#   value = {
#     region_a = join(", ", data.google_compute_zones.region_a.names)
#     region_b = join(", ", data.google_compute_zones.region_b.names)
#   }
# }


# # https://developer.hashicorp.com/terraform/language/values/outputs

# # MIG Status
# output "mig_stability_status" {
#   value = {
#     region_a = google_compute_region_instance_group_manager.region_a.status[0].is_stable
#     region_b = google_compute_region_instance_group_manager.region_b.status[0].is_stable
#   }
# }

# # ALB Frontend Static IP
# output "lb_static_ip_address" {
#   description = "The static IP address of the load balancer."
#   value       = "http://${google_compute_global_address.lb.address}"
# }

# # https://developer.hashicorp.com/terraform/language/functions/join
# output "compute_zones" {
#   description = "Comma-separated compute zones"
#   # convert set into string delimited by commas (CSV) before output
#   value = {
#     region_a = join(", ", data.google_compute_zones.region_a.names)
#     region_b = join(", ", data.google_compute_zones.region_b.names)
#   }
# }

# https://developer.hashicorp.com/terraform/language/values/outputs

# output "instance_external_ip" {
#   value       = "http://${google_compute_instance.doing-laundry.network_interface[0].access_config[0].nat_ip}"
#   description = "The external IP address of the GCE instance."
# }


# output "instance_external_ips" {
#   value = {
#     vm1 = "http://${google_compute_instance.doing-laundry.network_interface[0].access_config[0].nat_ip}"
#     vm2 = "http://${google_compute_instance.sakura-vm.network_interface[0].access_config[0].nat_ip}"
#     vm3 = "http://${google_compute_instance.brasil-vm.network_interface[0].access_config[0].nat_ip}"
#   }
#   description = "External IPs of both VMs"
# }
