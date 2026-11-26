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
    sideloadInitLua = true;
  };
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/applications/editor/nvim";
}
