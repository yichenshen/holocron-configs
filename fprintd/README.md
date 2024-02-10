# fprintd

fprintd is the service in charge of finerprints. Fingerprints can be enrolled with `fprintd-enroll`.

When finerprint is enrolled, it'll become the first choice when requesting sudo permissions. Most laptops have the fingerprint scanner under the lid, so when we're working with a monitor and have the lid closed, this become quite annoying.

Here, we try to bypass the fingerprint scanner if the lid is closed.

## pam_check_lid

This script returns an error if the lid is closed. We'll use it as a fake auth step to shortcircuit the fingerprint scanner.

```bash
sudo ln -s pam_check_lid /usr/local/bin
```

## Auth

Now insert this script to right before the `pam_fprintd.so` so skip one step if the lid is closed. The file is `/etc/pam.d/system-auth` 

```
auth   [success=ignore default=1]  pam_exec.so quiet /usr/local/bin/pam_check_lid
auth   sufficient                  pam_fprintd.so
```

This tells it to move to the next step if the script is successful (lid open) and start finerprint scanning. `default=1` tells it to skip 1 step if it fails (lid closed).
