# NGINX

These files serves as template files for various NGINX web/reverse proxy applications. Refer to the individual files for documentation

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
sudo systemctl enable certbot_renewal.timer
sudo systemctl start certbot_renewal.timer
```
