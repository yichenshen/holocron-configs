# Omada

Configs here are for setting up the TP-Link Omada Software Controller as a podman container. You can refer to the docker repo's [guide](https://github.com/mbentley/docker-omada-controller?tab=readme-ov-file#quickstart-guide).

## Dependencies

- podman
- systemd-container
- NGINX

## NGINX

Refer to the NGINX directory in this repo. Setup the server block for Omada first.

## User

Create a user for Omada.

```bash
sudo useradd -r -m -d /home/omada -s /sbin/nologin omada
sudo usermod -a -G systemd-journal omada
sudo loginctl enable-linger omada
../docker-transmission-openvpn/allocate_subids.sh omada
```

## Install container

Move the container file to `omada` user's container folder and start the container.

```bash
sudo machinectl shell omada@ /usr/bin/mkdir -p /home/omada/.config/containers/systemd
sudo cp omada.container /home/omada/.config/containers/systemd/
sudo chown omada:omada /home/omada/.config/containers/systemd/omada.container
sudo machinectl shell omada@ /usr/bin/systemctl --user daemon-reload
sudo machinectl shell omada@ /usr/bin/systemctl --user start omada
```
