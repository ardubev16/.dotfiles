{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    chafa
    dotnet-sdk
    gh
    go
    luajitPackages.luarocks
    nodejs
    rustup
    ueberzugpp
    viu
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    sideloadInitLua = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/applications/editor/nvim";
}
