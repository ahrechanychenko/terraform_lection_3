data "google_compute_image" "my_image" {
  family  = "debian-10"
  project = "debian-cloud"
}

data "google_compute_network" "my-network" {
  name    = "hillel-devops"
  project = var.project_id
}

data "google_compute_subnetwork" "my-subnetwork" {
  name   = "private"
  region = var.region
}