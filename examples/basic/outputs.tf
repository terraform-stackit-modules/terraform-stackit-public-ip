output "public_ip_ids" {
  description = "Map of public IP key to reserved public IP ID."
  value       = module.public_ip.public_ip_ids
}

output "public_ips" {
  description = "Map of public IP key to the allocated IP address."
  value       = module.public_ip.public_ips
}
