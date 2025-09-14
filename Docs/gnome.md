# Gnome

Tweaks I make to the Gnome desktop.

## Shortcuts

Some shortcuts are overridden which is yucky

### Always on top

To get `Super+Space` for always on top, run

`gsettings set org.gnome.desktop.wm.keybindings always-on-top "['<Super>Space']"`

### Fix Ctrl+Alt+Up/Down

[Source](https://stackoverflow.com/a/74408842/6335363)

* `gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"`
* `gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"`

## Extensions

* [App indicator support](https://extensions.gnome.org/extension/615/appindicator-support/)
* [Blur my shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
* [Caffeine](https://extensions.gnome.org/extension/517/caffeine/)
* [PiP on top](https://extensions.gnome.org/extension/4691/pip-on-top/)
* [Gesture improvements](https://extensions.gnome.org/extension/4245/gesture-improvements/)
  (and also [X11 daemon](https://github.com/harshadgavali/gnome-x11-gesture-daemon)) (Gnome <= 44)
* [Grand Theft Focus](https://extensions.gnome.org/extension/5410/grand-theft-focus/)
* [GS Connect](https://extensions.gnome.org/extension/1319/gsconnect/)
* [Hide minimized](https://extensions.gnome.org/extension/2639/hide-minimized/)
* [Lock keys](https://extensions.gnome.org/extension/36/lock-keys/)
* [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano/)
* [Quick close in overview](https://extensions.gnome.org/extension/352/middle-click-to-close-in-overview/)
* [Rounded Window Corners Reborn](https://extensions.gnome.org/extension/7048/rounded-window-corners-reborn/)
* [Panel Workspace Scroll](https://extensions.gnome.org/extension/6523/panel-workspace-scroll/)
