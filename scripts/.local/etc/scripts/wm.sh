#!/usr/bin/bash

# This script selects the wm for Plasma Workspace
# It is meant to be placed in ~/.config/plasma-workspace/env/
if [ -z "$QT_WAYLAND_FORCE_DPI" ]; then
    true
    # Disable KWin and use i3gaps as WM
    #export KDEWM=/usr/bin/i3

    # Compositor (Animations, Shadows, Transparency)
    # xcompmgr -C
    #compton -cCfb --backend glx --vsync opengl
else
    true
    # export KDEWM=/usr/bin/sway

    # Compositor
    # weston -B wayland-backend.so --fullscreen
fi
