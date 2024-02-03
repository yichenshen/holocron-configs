# NGINX

These files serves as template files for various NGINX web/reverse proxy applications. Refer to the individual files for documentation

## Configs

Configurations are available for:

 - Emby
 - Fedora Cockpit
 - Transmission
 - www
 - https redirects

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

The default configuration assumes that SSL is setup accordingly for Cloudflare, refer below.

Then restart NGINX: `sudo systemctl restart nginx`.

> You can also symlink the configurations for auto updates, but keep in mind that SELinux will need to be configured for permission issues. Also keep in mind that NGINX has to be restarted for changes to take effect.

### SELinux

NGINX can only access httpd_config_t files. If symlinking, the original files need to be set to the right context.

```sh
semanage fcontext -a -t httpd_config_t '$(git rev-parse --show-toplevel)/nginx(/.*)?'
restorecon -R .
```

## Auth

Some server blocks may make use of basic authentication. You'll need a password file to be able to use them. Create one with `openssl`:

```sh
sudo sh -c "echo -n '<user>:' >> /etc/nginx/.htpasswd"
sudo sh -c "openssl passwd -apr1 >> /etc/nginx/.htpasswd"
```

## HTTPS

Below are instructions for setting up HTTPS using [letsencrypt](https://letsencrypt.org) and [certbot](https://certbot.eff.org/).

### Install

Install certbot as well as the NGINX plugin:

```sh
sudo dnf install certbot python3-certbot-nginx
```

### Setup

```sh
sudo certbot certonly --nginx
```

Follow the prompts. Refer to Cloudflare for list of domains. This requests a cert and stores it at `/etc/letsencrypt/live/ycholocron.com/`

### Renewal

Turn on the systemd timer to renew certs automatically.

```sh
sudo systemctl enable certbot-renew.timer
sudo systemctl start certbot-renew.timer
```

### Cloudflare client cert

Set up cloudflare client verification by downloading the Cloudflare client cert and placing it in `/etc/nginx/certs/`.

Refer to `default.d/ssh.conf` for more details.

### DH Param

Generate a stronger Diffie-Hellman parameter:

```sh
sudo openssl dhparm --out /etc/nginx/certs/dhparam.pem 4096
```
