#!/bin/bash

MPRIS_PLAYER=$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep "mpris" | cut -d " " -f 8)

CURRENT_SONG=$(dbus-send --session --print-reply --type=method_call --dest="org.mpris.MediaPlayer2.chromium.instance1462" /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll "string:org.mpris.MediaPlayer2.Player" | grep -A 1 "xesam:title" | grep "variant" | cut -d '"' -f 2)

echo $CURRENT_SONG
