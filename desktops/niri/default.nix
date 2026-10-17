{ config, lib, ... }:
{
  # niri and xwayland-satellite are system packages (dnf); only the config is managed here.
  config = lib.mkIf config.global.gui {
    xdg.configFile."niri".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/desktops/niri/niri";
  };
}
