# NGINX

These files serves as template files for various NGINX web/reverse proxy applications. Refer to the individual files for documentation

## Configs

Configurations are available for:

 - Plex

### Directory sturcture

 - `archive`
  - These are archived `.conf` files that are no longer used. They're kept purely for reference.
 - `default.d`
  - These default configurations to be included in every server block
 - `conf.d`
  - Server blocks are stored here
  - This folder can also be used to store global configs

### Documentation

Config specific documentation are available as comments within the `.conf` files themselves.

## Installation

Copy the the `.conf` files to the respective NGINX system folders.

```sh
sudo ln -s default.d/* /etc/nginx/default.d/
sudo ln -s conf.d/* /etc/nginx/conf.d/
```

The default configuration assumes that SSL is setup accordingly for Cloudflare, refere below.

Then restart NGINX: `sudo systemctl restart nginx`.

> You can also symlink the configurations for auto updates, but keep in mind that SELinux will need to be configured for permission issues. Also keep in mind that NGINX has to be restarted for changes to take effect.

## Auth

Some server blocks may make use of basic authentication. You'll need a password file to be able to use them. Create one with `openssl`:

```sh
sudo sh -c "echo -n '<user>:' >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
```

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

### Cloudflare client cert

Set up cloudflare client verification by downloading the Cloudflare client cert and placing it in `/etc/nginx/certs/`.

Refer to `default.d/ssh.conf` for more details.
