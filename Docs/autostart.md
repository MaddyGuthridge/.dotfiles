# Autostart modifications

Some apps like to open in the foreground when my system starts, which is
extremely annoying. Here's the flags to modify their start-up flags in order to
make them start minimized.

## Thunderbird

Use the Birdtray app, which also keeps Thunderbird in the system tray.

## Teams (Flatpak)

Use flag `--minimized`

## Slack (RPM)

Use flag `%U -u`
Note that `-u` needs to be after `%U` or it will crash

## Discord (Flatpak)

Use flag `--start-minimized`

## Solaar

Use flags `-w hide -b symbolic`
