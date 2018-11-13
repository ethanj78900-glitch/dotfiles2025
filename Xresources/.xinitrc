#!/usr/bin/sh

# Mandatorily source xinitrc-common, which is common code shared between the
# Xsession and xinitrc scripts which has been factored out to avoid duplication
. /etc/X11/xinit/xinitrc-common

xrdb -I$HOME -merge ~/.Xresources

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3|i3wm           )
        xkb-switch -s us(altgr-intl)
        export QT_QPA_PLATFORMTHEME='qt5ct'
        exec i3
        ;;
    kde               )
        exec startkde
        ;;
    xfce|xfce4        )
        exec startxfce4
        ;;
    # No known session, try to run it as command ;
    # useful for starting programs without WM
    *                 ) exec $1;;
esac
