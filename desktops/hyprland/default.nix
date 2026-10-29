{ config, lib, ... }:
{
  # hyprland is a system package (dnf); only its config is managed here.
  config = lib.mkIf config.global.gui {
    xdg.configFile."hypr".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/desktops/hyprland/hypr";
  };
}
