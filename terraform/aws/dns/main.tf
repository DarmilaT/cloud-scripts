resource "aws_route53_zone" "route53_hz" {
  name = var.domain_name
}

resource "aws_route53_record" "root_domain" {
  zone_id = aws_route53_zone.route53_hz.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [var.ip_address]
}

resource "aws_route53_record" "www_subdomain" {
  zone_id = aws_route53_zone.route53_hz.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.ip_address]
}
