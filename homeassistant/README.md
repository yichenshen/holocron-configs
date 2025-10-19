# Home Assistant

Configs here are for setting up Home Assistant as a podman container. This config is essentially adaption the [Home Assistant container installation](https://www.home-assistant.io/installation/linux/#install-home-assistant-container) steps to Podman Quadlet.

## Dependencies

- podman
- systemd-container
- NGINX

## NGINX

Refer to the NGINX directory in this repo. Setup the server block for Home Assistant first. That will setup the reverse proxy to expose the Home Assistant port.

## User

Create a user for Home Assistant. Home Assistant will run under this user.

```bash
sudo useradd -r -m -d /home/ha -s /sbin/nologin ha
sudo usermod -a -G systemd-journal ha
sudo loginctl enable-linger ha
../docker-transmission-openvpn/allocate_subids.sh ha
```

## Install container

Move the container file to `ha` user's container folder and start the container.

```bash
machinectl shell ha@ /usr/bin/mkdir -p ~/.config/containers/systemd
sudo cp ha.container /home/ha/.config/containers/systemd/
sudo chown ha:ha /home/ha/.config/containers/systemd/homeassistant.container
machinectl shell ha@ /usr/bin/systemctl --user daemon-reload
machinectl shell ha@ /usr/bin/systemctl --user start homeassistant
```

After this is started, you should be able to connect via the Home Assistant URL in the NGINX server block directly to setup Home Assistant.
