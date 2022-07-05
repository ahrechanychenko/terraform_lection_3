locals {
  image_id = data.google_compute_image.my_image.self_link
  tags     = concat(["web", "allow-http"], ["another-tag"])
}