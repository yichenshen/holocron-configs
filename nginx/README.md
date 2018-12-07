# NGINX

These files serves as template files for various NGINX web/reverse proxy applications. Refer to the individual files for documentation

## Configs

Configurations are available for:

 - Plex

### Directory sturcture

 - `archive`
  - These are archived `.conf` files that are no longer used. They're kept purely for reference.

### Documentation

Config specific documentation are available as comments within the `.conf` files themselves.

## Installation

It is recommended that you hardlink the `.conf` files to the NGINX system folders instead of doing a softlink. This difference is such that system files will not depends on user files. I.e. If I clone this repo into a user directory, when I remove the user, the NGINX configurations will not suddenly become dead links.

## HTTPS

Below are instructions for setting up HTTPS using [letsencrypt](https://letsencrypt.org) and [certbot](https://certbot.eff.org/).

### INI File

Create `/etc/letsencrypt/cloudflare.ini` with the format:

```
# Cloudflare API credentials used by Certbot
dns_cloudflare_email = cloudflare@example.com
dns_cloudflare_api_key = 0123456789abcdef0123456789abcdef01234567
```

Change the permission to for the ini file to `600`:
```sh
sudo chmod 600 /etc/letsencrypt/cloudflare.ini
```

### Command

```sh
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini --post-hook "systemctl restart nginx" -d <domain1> -d <domain2>
```

### Renewal

Turn on the systemd timer to renew certs automatically.

```sh
sudo systemctl enable certbot-renew.timer
sudo systemctl start certbot-renew.timer
```
