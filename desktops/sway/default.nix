{ config, lib, ... }:
let
  dir = "${config.home.homeDirectory}/.dotfiles/desktops/sway";
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  # sway and noctalia are system packages (dnf); only their config is managed here.
  config = lib.mkIf config.global.gui {
    xdg.configFile."sway".source = link "${dir}/sway";
    # Only the file: Noctalia writes GUI overrides next to it, which must stay out of the repo.
    xdg.configFile."noctalia/config.toml".source = link "${dir}/noctalia/config.toml";
  };
}
