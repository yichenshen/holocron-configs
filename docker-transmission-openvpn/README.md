# Transmission with OpenVPN

These configs are for setting up a Transmission client with VPN inside a Docker container.

The docker container used can be referenced at: https://github.com/haugene/docker-transmission-openvpn

The setup here uses `podman` in place of Docker to maintain compatibility with Fedora. It uses NordVPN as the VPN provider.

## Dependencies

 - podman
 - systemd-container

## Modprobe

In order to run OpenVPN in a docker container, a tunnel device needs to mounted on the container. However, SELinux prevents kernel modules from loading in docker. To get around it, we have to enable `tun` in the host itself with: `modprobe tun`.

To avoid having to do this everytime the system reboots, copy `tun.conf` to `/etc/modules-load.d/`, and change the owner to root. This will load the module on startup.

Enable access from containers using

```
sudo setsebool -P container_use_devices 1
```

## Directory

Create a directory for transmission and change the SELinux context for the container. This is where the actual data lives. The config directory will be mounted as a named volume.

```bash
sudo mkdir /var/transmission
sudo semanage fcontext -a -t container_file_t "/var/transmission(/.+)?"
sudo restorecon -Frv /var/transmission"
```

## User

We run the container under the trasnmission user. This user needs to be created and configured to run podman. It also needs subuid and subgid ranges to run podman.

```bash
sudo useradd -r -m -d /home/transmission -s /sbin/nologin transmission
sudo usermod -a -G systemd-journal transmission
sudo loginctl enable-linger transmission
./allocate_subids.sh transmission
sudo chown -R transmission /var/transmission
```

## Container

The container is configured here to run as a systemd container with podman systemd. Copy `transmission-openvpn.container` to `/home/transmission/.config/container/systemd/` (create directory under transmission if not present) and`chown` it to `transmission`. Similarly, copy `env.list` to `/home/transmission/` and chown it as well.

### Authentication

Authentication parameters exists in `env.list`.

Set your NordVPN username and password by replacing `<VPN USERNAME>` and `<VPN PASSWORD>`.

You may set the username and password for the transmission web client by replacing  `<TRANSMISSION_RPC_USERNAME>` and `<TRANSMISSION_RPC_PASSWORD>`.

### Start container

Reload and start the container within the transmission user with:

```bash
machinectl shell transmission@ /usr/bin/systemctl --user daemon-reload
machinectl shell transmission@ /usr/bin/systemctl --user start transmission-openvpn
```

## Web Client

The client will be available at `/transmission/web`. By default the client will be accessible on port 9091 or the host machine. However, it is recommended to have it behind a reverse proxy instead. Refer to the `nginx` folder in this repo to find the transmission config.
