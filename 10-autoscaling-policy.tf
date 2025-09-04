# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler
#Resource: MIG Autoscaling
resource "google_compute_region_autoscaler" "app" {
  name   = "app-autoscaler"
  region = "us-west1"
  target = google_compute_region_instance_group_manager.dibeann-mig.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    # 50% CPU for autoscaling event
    cpu_utilization {
      target = 0.5
    }
  }
}