data "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "${var.public_key["name"]}"
}
