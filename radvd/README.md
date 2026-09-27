# RADVD

Router Advertisement Daemon is used to send Router Advertisements for IPv6.

We're using it to setup a simple ULA advertiser for stable local IPv6 routing.

## Requirements

- radvd

## Installation

```
sudo cp radvd.conf /etc/radvd.conf
```

ULA prefix was randomly generated.

```
sudo systemctl enable radvd
sudo systemctl start radvd
```
