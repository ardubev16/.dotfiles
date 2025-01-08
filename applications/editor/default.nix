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
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/applications/editor/nvim";
}
