# dnsmasq

dnsmasq is a simple DNS forwarder. We're using it here so that we can configure local traffic to connect directly while sending external requests to Cloudflare.

## Installation

Link the configuration to the system dnsmasq config and enable dnsmasq:

```
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
sudo cp dnsmasq.conf /etc/dnsmasq.conf
sudo systemctl start dnsmasq
sudo systemctl enable dnsmasq
```

## Firewall

We need to allow port 53 traffic to come through to accept DNS requests:

```
sudo firewall-cmd --add-service=dns
sudo firewall-cmd --add-service=dns --permanent
```

It might be good to limit this only to the local network with `--zone=home`.
