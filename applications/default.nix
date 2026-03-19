{
  config,
  lib,
  ...
}:
{
  imports = [
    ./editor
    ./git
    ./shell
    ./tmux
  ] ++ lib.optional config.global.gui ./terminal.nix;
}
