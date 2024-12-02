{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    chafa
    fd
    fzf
    git
    lazygit
    rg
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

  xdg.configFile."nvim".source = ../dotfiles/nvim;
}
