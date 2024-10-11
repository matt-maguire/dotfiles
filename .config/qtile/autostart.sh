#!/usr/bin/env sh

ibus-daemon -rxRd
xautolock -detectsleep -time 30 -locker "mate-screensaver-command -l"&
emacs&
