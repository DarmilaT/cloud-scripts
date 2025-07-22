output "public_ip_GrafanaServer_ubuntu" {
  value = aws_instance.GrafanaServer_ubuntu.public_ip
}

output "public_ip_ZabbixServer_ubuntu" {
  value = aws_instance.ZabbixServer_ubuntu.public_ip
}

# output "public_ip_ZabbixServer-rhel" {
#   value = aws_instance.ZabbixServer-rhel.public_ip
# }

output "public_ip_ZabbixAgent_windows" {
  value = aws_instance.ZabbixAgent_windows.public_ip
}