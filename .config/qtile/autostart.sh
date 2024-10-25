#!/usr/bin/env sh

ibus-daemon -rxRd
blueman-applet&
nm-applet&
nextcloud&
xautolock -detectsleep -time 30 -locker "mate-screensaver-command -l"&
emacs&
