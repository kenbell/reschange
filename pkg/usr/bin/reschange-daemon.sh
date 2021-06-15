#! /bin/bash

MONITOR="card0-DP-2"

DEFAULT_MODE=`cat /sys/class/drm/${MONITOR}/modes | head -1`
echo "Detected default mode $DEFAULT_MODE"

while true
do
  sleep 5
  echo detect > /sys/class/drm/${MONITOR}/status

  NEW_MODE=`cat /sys/class/drm/${MONITOR}/modes | head -1`

  if [ "${NEW_MODE}" != "${DEFAULT_MODE}" ]; then
    DEFAULT_MODE="${NEW_MODE}"

    echo "Switching to ${DEFAULT_MODE}"

    # Recommended (default) mode changed, so switch port off and
    # on again, which forces wayland to adapt to new resolution
    echo off > /sys/class/drm/${MONITOR}/status
    echo on > /sys/class/drm/${MONITOR}/status
  fi
done
