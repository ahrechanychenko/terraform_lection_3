output "set_example" {
  value = var.set_example
}

output "list" {
  value = var.source_ips_list.2
}

output "map_example" {
  value = var.users["user1"]["first_name"]
}

output "image" {
  value = data.google_compute_image.my_image
}

output "artem_service_account" {
  value = google_service_account.service_account[0]
}

output "all_service_accounts" {
  value = google_service_account.service_account[*]
}


output "image_id" {
  value = local.image_id
}

output "tags" {
  value = local.tags
}


output "instance_ips" {
  value = {
    for instance in google_compute_instance.default :
    instance.name => instance.network_interface.0.access_config[0].nat_ip
  }
}

output "subnet" {
  value = data.google_compute_subnetwork.my-subnetwork
}

output "accounts" {
  value = google_service_account.service_accounts_for_project[*]
}

output "buckets" {
  value = {
    for bucket in google_storage_bucket.local_buckets:
        bucket.id => bucket.url
  }
}
