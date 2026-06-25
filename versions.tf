terraform {
  required_version = ">=1.15, <2.0.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">=5.21.0, <6.0.0"
    }
  }
}
