#!/bin/bash

USER=$1

NEW_SUBUID=$(($(tail -1 /etc/subuid |awk -F ":" '{print $2}')+65536))
NEW_SUBGID=$(($(tail -1 /etc/subgid |awk -F ":" '{print $2}')+65536))

sudo usermod \
--add-subuids ${NEW_SUBUID}-$((${NEW_SUBUID}+65535)) \
--add-subgids ${NEW_SUBGID}-$((${NEW_SUBGID}+65535)) \
  "$USER"
