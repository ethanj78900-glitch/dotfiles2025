#!/usr/bin/bash

# This scripts starts up the SSH agent if the session is not Plasma Wayland
# It is meant to be placed in ~/.config/autostart-scripts/
if [ -z "$QT_WAYLAND_FORCE_DPI" ]; then
    eval "$(ssh-agent -s)"
    ssh-add
else
    true
fi
