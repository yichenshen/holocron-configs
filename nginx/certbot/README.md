# Certbot

## INI File

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

## Command

```sh
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini --post-hook "systemctl restart nginx" -d <domain1> -d <domain2>
```

## Renewal

Copy the systemd files to `/etc/systemd/system/`.

```sh
sudo cp certbot.{service,timer} /etc/systemd/systemd/
sudo systemctl daemon-reload
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer
```
