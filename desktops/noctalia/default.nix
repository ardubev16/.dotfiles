{ config, lib, ... }:
{
  # Noctalia is a system package (dnf).
  config = lib.mkIf config.global.gui {
    # Only the file: Noctalia writes GUI overrides next to it, which must stay out of the repo.
    xdg.configFile."noctalia/config.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/desktops/noctalia/config.toml";
  };
}
