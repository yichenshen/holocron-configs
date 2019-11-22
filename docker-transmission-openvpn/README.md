# Transmission with OpenVPN

These configs are for setting up a Transmission client with VPN inside a Docker container.

The docker container used can be referenced at: https://github.com/haugene/docker-transmission-openvpn

The setup here uses `podman` in place of Docker to maintain compatibility with Fedora. It uses NordVPN as the VPN provider.

## Modprobe

In order to run OpenVPN in a docker container, a tunnel device needs to mounted on the container. However, SELinux prevents kernel modules from loading in docker. To get around it, we have to enable `tun` in the host itself with: `modprobe tun`.

To avoid having to do this everytime the system reboots, copy `tun.conf` to `/etc/modules-load.d/`, and change the owner to root. This will load the module on startup.

## Directory

Create a directory for transmission and move the env file into it so that it can be read by the systemd service.

```bash
sudo mkdir /var/transmission
sudo mv env.list /var/transmission/
```

## Container

The container is configured here to run as a systemd service. Move the service file to `/etc/systemd/system/`. Then run `systemctl daemon-reload`.

Start the service after full setup with `systemctl start transmission-openvpn`.

### Authentication

Authentication parameters exists in `env.list`.

Set your NordVPN username and password by replacing `<VPN USER>` and `<VPN PASSWORD>`.

You may set the username and password for the transmission web client by replacing  `<TRANSMISSION_RPC_USERNAME>` and `<TRANSMISSION_RPC_PASSWORD>`.

### Networking issues

Certain VPNs might have networking issues when torrenting with a UDP connection. Refer to the discussion [here](https://github.com/haugene/docker-transmission-openvpn/issues/257#issuecomment-449576866).

Note that the `--mssfix` has been set for the value recommended for NordVPN. Change it accordingly.

## Web Client

The client will be available at `/transmission/web`. By default the client will accessible on port 9091 or the host machine. However, it is recommended to have it behind a reverse proxy instead. Refer to the `nginx` folder in this repo to find the transmission config.
