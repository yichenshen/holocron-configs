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
sudo cp homeassistant.container /home/ha/.config/containers/systemd/
sudo chown ha:ha /home/ha/.config/containers/systemd/homeassistant.container
machinectl shell ha@ /usr/bin/systemctl --user daemon-reload
machinectl shell ha@ /usr/bin/systemctl --user start homeassistant
```

After this is started, when navigating to the Home Assistant URL, you'll get an error 400 response. This is because Home Assistant does not allow proxies unless allowlisted.

You can still sanity check if HA is running by temporarily allowing the HA port for direct access:

```bash
sudo firewall-cmd --add-port=8123/tcp
```

Then you can temporarily connect directly to HA with `http://<ip>:8123`. Note that SSL is not setup at this point.

## Allowlist Proxy

To setup the reverse proxy you need the configuration as specified [here](https://www.home-assistant.io/integrations/http/#reverse-proxies).

We used a named volume to setup the HA config directory, so we need to mount it and modify it.

```bash
sudo machinectl shell ha@ /usr/bin/podman unshare /usr/bin/podman volume mount ha-config
```

This will return a directory. You can find `configuration.yaml` in that directory. Open and modify it to add

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 127.0.0.1
    - <lan ip>
```

You can check the value needed for `<lan ip>` from the HA UI interface under Settings => System => Logs, where you should see an error if you tried to connect with the URL through NGINX.

Save and unmount the volume, then restart the container.

```bash
sudo machinectl shell ha@ /usr/bin/podman unshare /usr/bin/podman volume unmount ha-config
sudo machinectl shell ha@ /usr/bin/systemctl --user restart homeassistant
```

You should now be able to connect to HA directly via the URL with vanilla SSL port 443. You can reset the firewall to close up port 8123 after this.

```bash
sudo firewall-cmd --reload
```

## Matter Server

To allow for HA to control Matter devices, we need to run the Matter server as well. This is done with another container.

```bash
sudo cp matter.container /home/ha/.config/containers/systemd/
sudo chown ha:ha /home/ha/.config/containers/systemd/matter.container
machinectl shell ha@ /usr/bin/systemctl --user daemon-reload
machinectl shell ha@ /usr/bin/systemctl --user start matter
```

This should start the Matter server on port 5580. You can then add it as an HA integration by supplying the url with port 5580.

## Thread

One final step is to allow for Thread border router discovery. We need to expose the mdns port for this.

```
sudo firewall-cmd --add-service=mdns
sudo firewall-cmd --add-service=mdns --permanent
```

After this, HA's Thread integration should pick up any border routers you have, assuming they're on the same VLAN. You can follow the [instructions](https://www.home-assistant.io/integrations/thread) to configure the default Thread network. You'll be able to add Matter on Thread devices like any other Matter device after this.
