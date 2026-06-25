variable "zone_id" {
  type = string
}

resource "cloudflare_dns_record" "spf" {
  zone_id = var.zone_id
  name    = "@"
  content = "\"v=spf1 -all\""
  type    = "TXT"
  ttl     = "3600"
}

resource "cloudflare_dns_record" "mx" {
  zone_id  = var.zone_id
  name     = "@"
  content  = "."
  type     = "MX"
  priority = 0
  ttl      = "3600"
}

resource "cloudflare_dns_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc"
  content = "\"v=DMARC1; p=reject;\""
  type    = "TXT"
  ttl     = "3600"
}
