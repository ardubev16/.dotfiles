{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeModules.baseUser ];

  global.notNixOS = true;

  global.toolsets.kubernetes = true;
  global.toolsets.security = true;
  global.toolsets.ai = true;

  home.packages =
    with pkgs;
    [
      awscli2
      azure-cli
      git-filter-repo
      git-lfs
      gnumake
      htop
      kmonad
      nushell
      powershell
      pre-commit
      spotify
      teams-for-linux
      telegram-desktop
      terraform
      tflint
      trivy
      uv
      yarn
      yazi
    ]
    ++ [
      crc
      openshift
      tektoncd-cli
    ];

  home.shellAliases = {
    # Open Ansible logs in a temporary file from the clipboard, also add newlines
    ansilog = ''
      TEMP_FILE=$(mktemp) \
        && xclip -select clipboard -out | sed "s/\\\\n/\\n/g" > $TEMP_FILE \
        && vim $TEMP_FILE
    '';
  };
}
