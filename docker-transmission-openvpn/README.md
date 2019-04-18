# Transmission with OpenVPN

These configs are for setting up a Transmission client with VPN inside a Docker container.

The docker container used can be referenced at: https://github.com/haugene/docker-transmission-openvpn

## Modprobe

In order to run OpenVPN in a docker container, a tunnel device needs to mounted on the container. However, SELinux prevents kernel modules from loading in docker. To get around it, we have to enable `tun` in the host itself with: `modprobe tun`.

To avoid having to do this everytime the system reboots, copy `tun.conf` to `/etc/modules-load.d/`, and change the owner to root. This will load the module on startup.

## User

Set up a system user named `transmission` to run the transmission container, and add your user to it's group so that you can have more access:

```sh
useradd -r -U transmission
usermod -a -G transmission $USER
```

> You have to relogin for the groups to update

Since you'll be running the container with this new user, you need to allow it access to Docker. Create a docker group (if you haven't already done so), and add the new user to it.

```sh
groupadd docker
usermod -aG docker transmission
```

> You'll need to restart Docker: `systemctl restart docker` for the `docker` group to be loaded.

## Container

The container is configured here to run as a systemd service. Change `transmission-openvpn.service` to specify your VPN provider, credentials, and config. Refer to the Github page for more details.

The `OPENVPN_CONFIG` usually specifies which OpenVPN config from the provider to use. For NordVPN for example, you can specify the server config file name here (without the .ovpn). E.g. `us2099.nordvpn.com.udp`.

You may also specify the `PUID` and `PGID` to have transmission run as a non-root user inside the container. Match this up with the `transmission` user and group created earlier for shared access. You can get the UID and GID with `id transmission`.


### Authetication

You may set the username and password for the transmission web client with `TRANSMISSION_RPC_USERNAME` and `TRANSMISSION_RPC_PASSWORD`.

### Networking issues

Certain VPNs might have networking issues when torrenting with a UDP connection. Refer to the discussion [here](https://github.com/haugene/docker-transmission-openvpn/issues/257#issuecomment-449576866).

Note that the `--mssfix` has been set for the value recommended for NordVPN. Change it accordingly.

## Web Client

The client will be available at `/transmission/web`. By default the client will accessible on port 9091 or the host machine. However, it is recommended to have it behind a reverse proxy instead. Refer to the `nginx` folder in this repo to find the transmission config.
