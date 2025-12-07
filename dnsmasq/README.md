# dnsmasq

dnsmasq is a simple DNS forwarder. We're using it here so that we can configure local traffic to connect directly while sending external requests to Cloudflare.

## Installation

Link the configuration to the system dnsmasq config and enable dnsmasq:

```
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo cp dnsmasq.d/* /etc/dnsmasq.d/
sudo systemctl start dnsmasq
sudo systemctl enable dnsmasq
```

### Firewall

We need to allow port 53 traffic to come through to accept DNS requests:

```
sudo firewall-cmd --add-service=dns
sudo firewall-cmd --add-service=dns --permanent
```

It might be good to limit this only to the local network with `--zone=home`.

### Router

To have the local network use this dnsmasq as the DNS server, reoute the router's LAN DNS to the server's local IPv4 and link-local IPv6.

If something goes bad, you can reset the DNS on the interface for a work machine to 1.1.1.1 to reestablish DNS.

## Local DNS

Setting the DNS on the router means that the local DNS will be also set to dnsmasq itself. This can be problematic for ddclient, because it'll essentially never see the need to update.

We can reset the local dns to bypass the the local dnsmasq.

```
sudo nmcli con mod enp3s0 ipv4.ignore-auto-dns yes
sudo nmcli con mod enp3s0 ipv4.dns "1.1.1.1,8.8.8.8"
sudo nmcli con mod enp3s0 ipv6.ignore-auto-dns yes
sudo nmcli con mod enp3s0 ipv6.dns "2606:4700:4700::1111,2001:4860:4860::8888"
```

> You'll need to set this for anything that is trying to check public DNS like ddns on OpenWRT. There you can configure ddns to use a custom DNS server.

## Overwritten Entries

- (\*.)ycholocron.com: Overritten to local IP to avoid Cloudflare
- ycap.ycholocron.com: Overritten to local IPv4 only due to difficulty obtaining IPv6
- github.com: Overritten to nat64.net nameserver to enable IPv6
