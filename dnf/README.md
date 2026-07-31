# DNF Reboot

The default DNF reboot command is `shutdown -r +5 'Rebooting after applying package updates'`.

This can run before akmods complete, because akmods run in the background.

In that situation the reboot will be blocked.

Instead, copy `/usr/local/bin/dnf-automatic-reboot.sh` to `/usr/local/bin/`, then point `/etc/dnf/automatic.conf` to use this script as `reboot_command`.

```bash
sudo cp dnf-automatic-reboot.sh /usr/local/bin/
sudo chmod u+x dnf-automatic-reboot.sh
```

`/etc/dnf/automatic.conf`

```
reboot_command = /usr/local/bin/dnf-automatic-reboot.sh
```
