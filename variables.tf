variable "project_id" {
  description = "STACKIT project ID in which the public IPs are managed."
  type        = string
}

variable "region" {
  description = "The resource region. If not defined, the provider region is used."
  type        = string
  default     = null
}

variable "labels" {
  description = "Key-value string pairs applied to every reserved public IP (merged with per-IP labels)."
  type        = map(string)
  default     = {}
}

variable "public_ips" {
  description = <<-EOT
    Map of public IPs to RESERVE (create), keyed by a stable identifier. Each value:
      - `network_interface_id` : optionally associate the reserved IP with a network interface
                                 (or virtual IP) ID. Leave null to reserve a floating IP.
      - `labels`               : per-IP labels (merged over `var.labels`).
  EOT
  type = map(object({
    network_interface_id = optional(string)
    labels               = optional(map(string), {})
  }))
  default = {}
}

variable "public_ip_associations" {
  description = <<-EOT
    Map of associations of PRE-EXISTING public IPs to network interfaces, keyed by a stable id.
    Use this when the public IP already exists (allocated elsewhere) — do NOT combine it with
    `public_ips` for the same IP or the same network interface (the STACKIT provider warns this
    causes conflicts). Each value:
      - `public_ip_id`         (required) : the existing public IP ID.
      - `network_interface_id` (required) : the network interface (or virtual IP) ID to attach to.
  EOT
  type = map(object({
    public_ip_id         = string
    network_interface_id = string
  }))
  default = {}
}
