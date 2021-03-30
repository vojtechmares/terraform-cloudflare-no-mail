# Terrafrom Cloudflare No Mail Module

This module is created to help you keep your domains safe off spam lists, block lists etc.

For Every domain, you do not use emails, configure these DNS records, to deny any mail going from your domains (if you did not set it up yourself) to keep your domain spam free, off spam list and non blocked.

No spammers can send valid mail from your domain.

Technically, spammers still can send mails from your domain, but every good behaving mail server will reject these mails with this DNS configuration.

## Usage

You only need to provide singe variable `zone_id` of the domain you wish to add these DNS records to.

This module requires Cloudflare provider **2.19.2** or newer.

### Example

```hcl
module "example_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.example_com.id // or variable
}
```

## Null MX record

According to [RFC 7505](https://tools.ietf.org/html/rfc7505), Null MX record has a priority of `0` and content `.`.

**NOTE**: TTL of this record is 1 second.

## No Cloudflare

If you are not using Cloudflare for your DNS, add these DNS records to your DNS manually:

- MX: name `@`, content `.`, priority `0` (if you add MX record in the future, cache won't be an issue)
- TXT: name `@`, content `v=spf1 -all`
- TXT: name `_dmarc`, content `v=DMARC1; p=reject;`
