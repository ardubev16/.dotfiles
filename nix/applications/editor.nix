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

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink ../dotfiles/nvim;

  programs.lazygit.enable = true;
  stylix.targets.lazygit.enable = true;
  # xdg.configFile."lazygit".source = ../dotfiles/lazygit.yaml;
}
