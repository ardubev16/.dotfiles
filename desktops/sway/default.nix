{ config, lib, ... }:
{
  # sway(fx) is a system package (dnf); only its config is managed here.
  config = lib.mkIf config.global.gui {
    xdg.configFile."sway".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/desktops/sway/sway";
  };
}
