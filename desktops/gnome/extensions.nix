{ pkgs, lib, ... }:
let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    auto-move-windows
    # forge
    fuzzy-app-search
    # gsconnect
    just-perfection
    launch-new-instance
    pop-shell
    removable-drive-menu
    # search-light
    vitals
    workspaces-indicator-by-open-apps
  ];
in
{
  programs.gnome-shell.extensions = builtins.map (e: { package = e; }) extensions;

  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "kitty.desktop:1"
        "brave-browser.desktop:2"
        "io.github.zen_browser.zen.desktop:2"
        "virtualbox.desktop:3"
        "com.spotify.Client.desktop:7"
        "org.mozilla.Thunderbird.desktop:8"
        "mozilla-thunderbird.desktop:8"
        "discord.desktop:9"
        "com.discordapp.Discord.desktop:9"
        "org.telegram.desktop.desktop:10"
      ];
    };

    # "org/gnome/shell/extensions/forge" = {
    #   window-gap-hidden-on-single = true;
    #   window-gap-size = mkUint32 6;
    # };
    # "org/gnome/shell/extensions/forge/keybindings" = {
    #   prefs-tiling-toggle = [];
    #   focus-border-toggle = [];
    #   window-swap-last-active = [];
    #   window-toggle-float = [ "<Super>f" ];
    #   window-toggle-always-float = [ "<Shift><Super>f" ];
    # };

    "org/gnome/shell/extensions/just-perfection" = {
      animation = 4;
      notification-banner-position = 2;
      activities-button = false;
    };

    "org/gnome/shell/extensions/pop-shell" = {
      fullscreen-launcher = true;
      pop-monitor-left = [ ];
      pop-monitor-right = [ ];
      pop-workspace-down = [ ];
      pop-workspace-up = [ ];
      smart-gaps = true;
      tile-by-default = true;
      tile-enter = [ ];
      tile-move-down-global = [ "<Shift><Super>j" ];
      tile-move-left-global = [ "<Shift><Super>h" ];
      tile-move-right-global = [ "<Shift><Super>l" ];
      tile-move-up-global = [ "<Shift><Super>k" ];
      toggle-floating = [ "<Super>f" ];
      toggle-tiling = [ ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      email = [ ];
      help = [ ];
      home = [ ];
      www = [ ];
    };

    "org/gnome/shell/extensions/search-light" = {
      shortcut-search = [ "<Super>space" ];
      popup-at-cursor-monitor = true;
      border-radius = 1.0;
      scale-width = 0.2;
      scale-height = 0.4;
      font-size = 0;
      entry-font-size = 1;
      background-color = mkTuple [
        0.2
        0.2
        0.2
        1.0
      ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ ];
      switch-input-source-backward = [ ];
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [
        "_temperature_thinkpad_cpu_"
        "_processor_usage_"
        "_memory_allocated_"
        "_storage_free_"
      ];
    };

    "org/gnome/shell/extensions/workspaces-indicator-by-open-apps" = {
      indicator-round-borders = false;
      indicator-hide-empty = true;
    };
  };
}
