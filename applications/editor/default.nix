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

  # FIXME: Prevent home-manager's neovim module from generating nvim/init.lua,
  # which conflicts with our custom config directory symlink above.
  # src: https://github.com/nix-community/home-manager/issues/5982#issuecomment-4615838595
  xdg.configFile."nvim/init.lua".enable = pkgs.lib.mkForce false;
}
