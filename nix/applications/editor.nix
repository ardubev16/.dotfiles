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
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink ../dotfiles/nvim;

  programs.lazygit.enable = true;
  stylix.targets.lazygit.enable = true;
  # xdg.configFile."lazygit".source = ../dotfiles/lazygit.yaml;

  programs.git.enable = true;
  xdg.configFile."git".source = ../dotfiles/gitconfig;
}
