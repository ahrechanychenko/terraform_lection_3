locals {
  rules = {
    for x in var.rules:
        "${x.name}" => x

  }
}

resource "google_compute_firewall" "test_firewall" {
  for_each = local.rules
  name = "firewall-rule-${var.project_id}-${each.value.name}"
  network = var.network
  allow {
    protocol = each.value.protocol
    ports = each.value.ports
  }
  source_ranges = each.value.source_ips
  target_tags = each.value.destination_tags


  //[{"protocol":"tcp", ports:[80,22,443], source_ips:["192.168.1.1/32", "10.10.10.10/32"], destination_tags:["one,"two"]},]
}