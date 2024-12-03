#!/usr/bin/env bash

# auto-move-windows
dconf write /org/gnome/shell/extensions/auto-move-windows/application-list "[\
    'kitty.desktop:1', \
    'brave-browser.desktop:2', 'io.github.zen_browser.zen.desktop:2' \
    'virtualbox.desktop:3', \
    'com.spotify.Client.desktop:7', \
    'org.mozilla.Thunderbird.desktop:8', 'mozilla-thunderbird.desktop:8', \
    'discord.desktop:9', 'com.discordapp.Discord.desktop:9', \
    'org.telegram.desktop.desktop:10', 'whatsdesk.desktop:10'\
]"

# just-perfection
dconf write /org/gnome/shell/extensions/just-perfection/animation 4
dconf write /org/gnome/shell/extensions/just-perfection/notification-banner-position 2
dconf write /org/gnome/shell/extensions/just-perfection/activities-button false

# workspaces-indicator-by-open-apps
dconf write /org/gnome/shell/extensions/workspaces-indicator-by-open-apps/indicator-round-borders false
dconf write /org/gnome/shell/extensions/workspaces-indicator-by-open-apps/indicator-hide-empty true

# search-light
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source "['']"
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward "['']"
dconf write /org/gnome/shell/extensions/search-light/shortcut-search "['<Super>space']"
dconf write /org/gnome/shell/extensions/search-light/popup-at-cursor-monitor true
dconf write /org/gnome/shell/extensions/search-light/border-radius 1.0
dconf write /org/gnome/shell/extensions/search-light/scale-width 0.2
dconf write /org/gnome/shell/extensions/search-light/scale-height 0.4
dconf write /org/gnome/shell/extensions/search-light/font-size 0
dconf write /org/gnome/shell/extensions/search-light/entry-font-size 1
dconf write /org/gnome/shell/extensions/search-light/background-color "(0.2, 0.2, 0.2, 1.0)"

# pop-shell
dconf write /org/gnome/shell/extensions/pop-shell/fullscreen-launcher true
dconf write /org/gnome/shell/extensions/pop-shell/pop-monitor-left "['']"
dconf write /org/gnome/shell/extensions/pop-shell/pop-monitor-right "['']"
dconf write /org/gnome/shell/extensions/pop-shell/pop-workspace-down "['']"
dconf write /org/gnome/shell/extensions/pop-shell/pop-workspace-up "['']"
dconf write /org/gnome/shell/extensions/pop-shell/smart-gaps true
dconf write /org/gnome/shell/extensions/pop-shell/tile-by-default true
dconf write /org/gnome/shell/extensions/pop-shell/tile-enter "['']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-move-down-global "['<Shift><Super>j']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-move-left-global "['<Shift><Super>h']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-move-right-global "['<Shift><Super>l']"
dconf write /org/gnome/shell/extensions/pop-shell/tile-move-up-global "['<Shift><Super>k']"

# forge
# dconf write /org/gnome/shell/extensions/forge/window-gap-hidden-on-single true
# dconf write /org/gnome/shell/extensions/forge/window-gap-size "uint32 6"
# dconf write /org/gnome/shell/extensions/forge/keybindings/prefs-tiling-toggle "['']"
# dconf write /org/gnome/shell/extensions/forge/keybindings/focus-border-toggle "['']"
# dconf write /org/gnome/shell/extensions/forge/keybindings/window-swap-last-active "['']"
# dconf write /org/gnome/shell/extensions/forge/keybindings/window-toggle-float "['<Super>f']"
# dconf write /org/gnome/shell/extensions/forge/keybindings/window-toggle-always-float "['<Shift><Super>f']"

# vitals
dconf write /org/gnome/shell/extensions/vitals/hot-sensors "['_temperature_thinkpad_cpu_', '_processor_usage_', '_memory_allocated_', '_storage_free_']"

# battery-health-charging
dconf write /org/gnome/shell/extensions/Battery-Health-Charging/charging-mode "'bal'"
dconf write /org/gnome/shell/extensions/Battery-Health-Charging/show-system-indicator false
