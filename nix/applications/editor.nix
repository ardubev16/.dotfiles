{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    chafa
    fd
    fzf
    git
    go
    nodejs
    ripgrep
    ueberzugpp
    viu
  ];

  home.shellAliases = {
    vi = "$EDITOR";
    vim = "$EDITOR";
    vimdiff = "$EDITOR";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nix/dotfiles/nvim";

  programs.lazygit.enable = true;
  stylix.targets.lazygit.enable = true;
  # FIXME: merge this config with the theme by stylix.
  # xdg.configFile."lazygit".source = ../dotfiles/lazygit.yaml;

  xdg.configFile."git".source = ../dotfiles/gitconfig;
}
