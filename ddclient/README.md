# ddclient

`ddclient` is a service that updates DDNS records.

The configuration here is set up for Cloudflare, together with DNS-O-Matic for IPV4.

> As ddclient does not allow simulataneous updates for both IPV6 and IPV4, we use DNS-O-Matic is a proxy for IPV4.

## Setup

1. Fill up the login (email), API key (for Cloudflare), and password (for DNS-O-Matic) in `ddclient.conf`
1. Copy the resulting file to `/etc/ddclient.conf`

The configuration assumes that you're behind a NAT for IPV4, but have a global address for IPV6. Furthermore, it assumes the external facing network interface to be `enps0s10`.

It is setup such that an external checker is used for IPV4, and the IPV6 is obtained from the network interface directly. As such, port forwarding is still required for IPV4.
