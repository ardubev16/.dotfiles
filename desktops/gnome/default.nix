{ lib, pkgs, ... }:
{
  imports = [ ./extensions.nix ];

  programs.gnome-shell.enable = true;
  home.packages = with pkgs; [
    dconf-editor
    gnome-extension-manager
    gnome-tweaks
  ];

  dconf.enable = true;
  dconf.settings = with lib.hm.gvariant; {
    # src: https://github.com/pop-os/shell/issues/142#issuecomment-678185443
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      edge-tiling = false;
    };
    "org/gnome/desktop/wm/preferences".num-workspaces = 10;
    "org/gnome/shell" = {
      disable-extension-version-validation = true;
      disabled-extensions = [];
      favorite-apps = [];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      switch-to-workspace-10 = ["<Super>0"];

      move-to-workspace-1 = ["<Super><Shift>1"];
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];
      move-to-workspace-10 = ["<Super><Shift>0"];

      close = ["<Super>q"];
      minimize = []; # disable <Super>h
    };

    "org/gnome/settings-daemon/plugins/media-keys".screensaver = ["<Super>x"];

    # keys speed
    "org/gnome/desktop/peripherals/keyboard" = {
      delay = mkUint32 250;
      # 20 is the milliseconds delay, it equals to 50 keys per second
      repeat-interval = mkUint32 20;
    };
    "org/gnome/desktop/peripherals/touchpad".tap-to-click = true;

    "org/gnome/desktop/remote-desktop/rdp".screen-share-mode = "extend";
    "org/gnome/desktop/sound".allow-volume-above-100-percent = true;
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
      enable-hot-corners = false;
      clock-format = "12h";
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = mkUint32 3700;
    };
    "org/gtk/settings/file-chooser".clock-format = "12h";
    "org/gtk/gtk4/settings/file-chooser".clock-format = "12h";
  };
}
