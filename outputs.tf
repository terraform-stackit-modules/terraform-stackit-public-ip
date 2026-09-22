output "public_ip_ids" {
  description = "Map of public IP key to reserved public IP ID."
  value       = { for k, p in stackit_public_ip.this : k => p.public_ip_id }
}

output "public_ips" {
  description = "Map of public IP key to the allocated IP address."
  value       = { for k, p in stackit_public_ip.this : k => p.ip }
}

output "associated_ips" {
  description = "Map of association key to the associated IP address."
  value       = { for k, a in stackit_public_ip_associate.this : k => a.ip }
}
