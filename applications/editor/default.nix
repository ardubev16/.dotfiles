{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    chafa
    dotnet-sdk
    fd
    fzf
    gh
    git
    go
    luajitPackages.luarocks
    nodejs
    ripgrep
    rustup
    ueberzugpp
    viu
  ];

  home.shellAliases = {
    vi = "$EDITOR";
    vim = "$EDITOR";
    vimdiff = "$EDITOR";
  };
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/applications/editor/nvim";
}
