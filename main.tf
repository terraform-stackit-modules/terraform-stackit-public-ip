resource "stackit_public_ip" "this" {
  for_each = var.public_ips

  project_id           = var.project_id
  region               = var.region
  network_interface_id = each.value.network_interface_id
  labels               = merge(var.labels, each.value.labels)
}

# Associate PRE-EXISTING public IPs to network interfaces. Do not mix with
# stackit_public_ip for the same IP/NIC (provider warns about conflicts).
resource "stackit_public_ip_associate" "this" {
  for_each = var.public_ip_associations

  project_id           = var.project_id
  region               = var.region
  public_ip_id         = each.value.public_ip_id
  network_interface_id = each.value.network_interface_id
}
