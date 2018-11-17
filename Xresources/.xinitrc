#!/usr/bin/sh

# xinitrc-common : copy of /etc/X11/xinit/xinitrc-common
# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
# I decided to copy this file instead of sourcing it just for the
# discoverability / ease of learning that having the file here in plain text
# provides.
#
# This is common code shared by both Xsession and xinitrc scripts.  Be sure
# to take this into account when fixing bugs or adding new functionality.

# Set up i18n environment
if [ -r /etc/profile.d/lang.sh ]; then
  . /etc/profile.d/lang.sh
fi

[ -r $HOME/.profile ] && . $HOME/.profile

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxkbmap=$HOME/.Xkbmap

sysresources=/etc/X11/Xresources
sysmodmap=/etc/X11/Xmodmap
sysxkbmap=/etc/X11/Xkbmap

# merge in defaults
[ -r "$sysresources" ] && xrdb -nocpp -merge "$sysresources"
[ -r "$userresources" ] && xrdb -I$HOME -merge "$userresources"

# merge in keymaps
if [ -r "$sysxkbmap" ]; then
    setxkbmap $(cat "$sysxkbmap")
fi

if [ -r "$userxkbmap" ]; then
    setxkbmap $(cat "$userxkbmap")
fi

# xkb and xmodmap don't play nice together
if ! [ -r "$sysxkbmap" -o -r "$userxkbmap" ] ; then
    [ -r "$sysmodmap" ] && xmodmap "$sysmodmap"
    [ -r "$usermodmap" ] && xmodmap "$usermodmap"
fi

# run all system xinitrc shell scripts.
for file in /etc/X11/xinit/xinitrc.d/* ; do
        . $file
done

# Prefix launch of session with ssh-agent if available and not already running.
if [ -z "$SSH_AGENT" ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ] && [ -x /usr/bin/ssh-agent ]; then
    if [ "x$TMPDIR" != "x" ]; then
        SSH_AGENT="/usr/bin/ssh-agent /bin/env TMPDIR=$TMPDIR"
    else
        SSH_AGENT="/usr/bin/ssh-agent"
    fi
fi

# Setup GIT_ASKPASS env if not set from a sensible list
if [ -z "$GIT_ASKPASS" ]; then
    for askpass in "$GIT_ASKPASS" ksshaskpass ssh-askpass-gnome x11-ssh-askpass ssh-askpass; do
        if command -v "$askpass" > /dev/null 2>&1; then
            export GIT_ASKPASS="$askpass"
            break
        fi
    done
fi

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3|i3wm           )
        export QT_QPA_PLATFORMTHEME='qt5ct'
        export GTK_THEME='Arc-Dark'
        export GTK2_RC_FILES='${HOME}/.gtkrc-2.0'
        exec $SSH_AGENT i3
        ;;
    kde               )
        exec $SSH_AGENT startkde
        ;;
    xfce|xfce4        )
        exec $SSH_AGENT startxfce4
        ;;
    # No known session, try to run it as command ;
    # useful for starting programs without WM
    *                 ) exec $1;;
esac
