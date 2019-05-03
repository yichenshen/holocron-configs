# WiFi Switch

This script turns on wifi when ethernet is off and turns it back on when ethernet is connected.

## Installation

1. Change `enp0s20u1u4` to your ethernet interface (get it from `ipconfig`)
2. Copy `99-wlan` to `/etc/NetworkManager/dispatcher.d`
