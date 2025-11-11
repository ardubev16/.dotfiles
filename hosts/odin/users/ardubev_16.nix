{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  home.packages = with pkgs; [
    act
    cloc
    discord
    gemini-cli
    gpclient
    htop
    httpie
    kmonad
    mariadb
    nushell
    pre-commit
    prometheus-alertmanager
    spotify
    telegram-desktop
    teleport
    terraform
    thunderbird
    uv
    yazi
  ];

  home.shellAliases = {
    unitnvpn = ''
      sudo ${lib.getExe' pkgs.gpclient "gpclient"}
          --fix-openssl connect
          --csd-wrapper /usr/libexec/openconnect/hipreport.sh
          --default-browser
          vpn-mfa.icts.unitn.it
    '';
  };
}
