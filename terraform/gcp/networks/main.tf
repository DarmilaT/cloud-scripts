resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
  network       = google_compute_network.vpc_network.id
  region        = var.region
  project      = var.project_id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  depends_on = [ google_compute_network.vpc_network ]
}