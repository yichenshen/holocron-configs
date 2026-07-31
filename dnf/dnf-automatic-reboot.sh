#!/bin/bash

for i in $(seq 1 60); do
    systemctl list-units 'akmods@*' --state=running --no-legend | grep -q . || break
    sleep 10
done

exec shutdown -r +5 'Rebooting after applying package updates'
