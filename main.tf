module "gcp_firewall_rules" {
  source     = "./modules/google_compute_firewall"
  project_id = var.project_id
  network    = data.google_compute_network.my-network.self_link
  rules = [
    { protocol : "tcp", name : "rule1"
      ports : [80, 22, 443],
      source_ips : ["192.168.1.1/32", "10.10.10.10/32"],
    destination_tags : ["one", "two"] },
    { protocol : "tcp",
      name : "rule2"
      ports : [2025],
      source_ips : ["50.40.30.20/32"],
  destination_tags : ["three"] }]
}


resource "google_compute_instance" "default" {
  for_each     = var.instances_config
  zone         = each.value.zone
  name         = each.value.instance_name
  machine_type = each.value.machine_type

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  dynamic "network_interface" {
    for_each = var.instances_config
    content {
      subnetwork = network_interface.value.network
    }
  }
  network_interface {
    subnetwork = data.google_compute_subnetwork.my-subnetwork.self_link
    access_config {
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}

resource "google_storage_bucket" "local_buckets" {
  count = 4
  name = "hillel-devops-course-bucket-${count.index}"
  location = "EU"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_service_account" "service_accounts_for_project" {
  count =x
  account_id = var.iam_user[count.index]
  display_name = "Service account ${var.iam_user[count.index]}"
}