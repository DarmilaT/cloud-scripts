output "hosted_zone_id" {
  description = "ID of the Route 53 Hosted Zone"
  value       = aws_route53_zone.route53_hz.id
}

output "nameservers" {
  description = "List of name servers for the domain"
  value       = aws_route53_zone.route53_hz.name_servers
}

output "root_a_record_fqdn" {
  description = "Fully qualified domain name for root A record"
  value       = aws_route53_record.root_domain.fqdn
}

output "www_a_record_fqdn" {
  description = "Fully qualified domain name for www A record"
  value       = aws_route53_record.www_subdomain.fqdn
}
