# reschange
Daemon to handle monitor resolution changes

Some wide-screen monitors support picture-by-picture mode where the output of two computers can be shown side-by-side.
When this happens, the monitor EDID is updated to be half the width.  However, currently wayland does not detect the
resolution change, so instead the monitor shows the full wide-screen image shrunk by 50%.

This repo contains a systemd daemon that periodically tells the kernel to re-detect the monitor resolution.
When a resolution change is discovered, it turns the monitor off and on again briefly.  Wayland then reacts as if the
monitor was disconnected and reconnected, discovering the new resolution correctly.

## Build
To create the .deb packagem run `make`

## Install
To install the .deb package, run `make install`

The package installs a systemd service `reschange`, use these commands to control:
```
systemctl status reschange  # current status
systemctl start reschange   # start the service
```
