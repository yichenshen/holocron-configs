# Jellyfin

Configs here are for setting up Jellyfin as a podman container. Jellyfin itself has pretty good [documentation](https://jellyfin.org/docs/), and it's recommended to go through that first.

## Dependencies

 - podman
 - systemd-container
 - NGINX
 - NVIDIA driver
 - [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## NGINX

Refer to the NGINX directory in this repo. Setup the server block for Jellyfin first. Without Jellfin running it'll simply return a bad gateway error, but setting this up first makes everything ready to go once Jellyfin is setup.

## User

Create a user for Jellyfin. Jellyfin will run under this user.

```bash
sudo useradd -r -m -d /home/jellyfin -s /sbin/nologin jellyfin
sudo usermod -a -G systemd-journal jellyfin
sudo loginctl enable-linger jellyfin
../docker-transmission-openvpn/allocate_subids.sh jellyfin
```

It might also be good to create a `media` group and add the interactive user and jellyfin to it, so that media files can be owned by this group.

```bash
sudo groupadd media
sudo usermod -a -G media jellyfin
```

While we're here, also add the user to the `video` group so we can work with hardware acceleration later.

```bash
sudo usermod -a -G video jellyfin
```

## SELinux

Set this following SELinux bool to allow containers to use GPU devices.

```bash
sudo setsebool -P container_use_dri_devices 1
```

## nvidia-container-toolkit

Install the toolkit from the link above. You'll then need to setup CDI following instructions [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html).

```bash
sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml
nvidia-ctk cdi list
```

## Setup data directory

```bash
sudo mkdir /var/media
sudo semanage fcontext -a -t container_file_t "/var/media(/.+)?"
sudo restorecon -Frv /var/media
sudo chown jellyfin:media /var/media
```

## Install container

Move the container file to `jellyfin` user's container folder and start the container.

```bash
machinectl shell jellyfin@ /usr/bin/mkdir -p ~/.config/containers/systemd
sudo cp jellyfin.container /home/jellyfin/.config/containers/systemd/
sudo chown jellyfin:jellyfin /home/jellyfin/.config/containers/systemd/jellyfin.container
machinectl shell jellyfin@ /usr/bin/systemctl --user daemon-reload
machinectl shell jellyfin@ /usr/bin/systemctl --user start jellyfin
```

After this is started, you should be able to connect via the Jellyfin URL in the NGINX server block directly to setup Jellyfin. Check for GPU with

```bash
machinectl shell jellyfin@ /usr/bin/podman exec -it systemd-jellyfin nvidia-smi -L
```
