# Bash

The bash configs here are a minimal setup meant to support `fish`, if it exists.

`fish` will be launched on GNOME Terminal, as well as a SSH session. If not, bash is launched with minimal setup.

`fish` is explicitly whitelisted to `exec`, so that system scripts that depends on bash, such as GNOME shell, will not be affected by `fish` executing in place of `bash`.

## Dependencies

 - fish

## Setup

> WARNING: install.sh will overwrite any existing bash configs!

Run `install.sh` to symlink the bash configs here to `~`.
